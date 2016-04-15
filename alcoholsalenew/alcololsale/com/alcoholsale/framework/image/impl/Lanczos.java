package com.alcoholsale.framework.image.impl;

import java.awt.image.BufferedImage;
import java.io.File;
import javax.imageio.ImageIO;

public class Lanczos {
	private static final double WORK_LOAD_FACTOR = 0.265D;
	private static final double LANCZOS_SUPPORT = 3.0D;
	private static final double LANCZOS_WINDOW = 3.0D;
	private static final double LANCZOS_SCALE = 1.0D;
	private static final double LANCZOS_BLUR = 1.0D;
	private static final double EPSILON = 1.0E-6D;

	public static BufferedImage resizeImage(BufferedImage image, double ratio) {
		return resizeImage(image, (int) (image.getWidth() * ratio + 0.5D),
				(int) (image.getHeight() * ratio + 0.5D));
	}

	public static BufferedImage resizeImage(BufferedImage image, double xRatio,
			double yRatio) {
		return resizeImage(image, (int) (image.getWidth() * xRatio + 0.5D),
				(int) (image.getHeight() * yRatio + 0.5D));
	}

	public static BufferedImage resizeImage(BufferedImage image, int width,
			int height) {
		double xFactor = width * 1.0D / image.getWidth();
		double yFactor = height * 1.0D / image.getHeight();

		BufferedImage resizeImage = new BufferedImage(width, height,
				image.getType());
		BufferedImage filterImage = null;
		if (xFactor * yFactor > 0.265D) {
			filterImage = new BufferedImage(width, image.getHeight(),
					image.getType());
			horizontalFilter(image, filterImage, xFactor, height);
			verticalFilter(filterImage, resizeImage, yFactor);
		} else {
			filterImage = new BufferedImage(image.getWidth(), height,
					image.getType());
			verticalFilter(image, filterImage, yFactor);
			horizontalFilter(filterImage, resizeImage, xFactor, height);
		}
		return resizeImage;
	}

	private static void verticalFilter(BufferedImage image,
			BufferedImage resizeImage, double yFactor) {
		double scale = Math.max(1.0D / yFactor, 1.0D);
		double support = scale * 3.0D;
		if (support < 0.5D) {
			support = 0.5D;
			scale = 1.0D;
		}
		scale = 1.0D / scale;
		for (int y = 0; y < resizeImage.getHeight(); y++) {
			double center = (y + 0.5D) / yFactor;
			int start = (int) (Math.max(center - support - 1.0E-6D, 0.0D) + 0.5D);
			int stop = (int) (Math.min(center + support, image.getHeight()) + 0.5D);
			double density = 0.0D;
			ContributionInfo[] contribution = new ContributionInfo[stop - start];
			for (int n = 0; n < stop - start; n++) {
				contribution[n] = new ContributionInfo(null);
				contribution[n].pixel = (start + n);
				contribution[n].weight = getResizeFilterWeight(scale
						* (start + n - center + 0.5D));
				density += contribution[n].weight;
			}
			int n = 0;	// 代码引入报错，无n变量
			if ((density != 0.0D) && (density != 1.0D)) {
				density = 1.0D / density;
				for (int i = 0; i < n; i++) {
					ContributionInfo.access$234(contribution[i], density);
				}
			}
			for (int x = 0; x < resizeImage.getWidth(); x++) {
				double red = 0.0D;
				double green = 0.0D;
				double blue = 0.0D;
				for (int i = 0; i < n; i++) {
					double alpha = contribution[i].weight;
					int rgb = image.getRGB(x, contribution[i].pixel);
					red += alpha * (rgb >> 16 & 0xFF);
					green += alpha * (rgb >> 8 & 0xFF);
					blue += alpha * (rgb & 0xFF);
				}
				int rgb = roundToQuantum(red) << 16
						| roundToQuantum(green) << 8 | roundToQuantum(blue);

				resizeImage.setRGB(x, y, rgb);
			}
		}
	}

	private static void horizontalFilter(BufferedImage image,
			BufferedImage resizeImage, double xFactor, int n) {
		double scale = Math.max(1.0D / xFactor, 1.0D);
		double support = scale * 3.0D;
		if (support < 0.5D) {
			support = 0.5D;
			scale = 1.0D;
		}
		scale = 1.0D / scale;
		for (int x = 0; x < resizeImage.getWidth(); x++) {
			double center = (x + 0.5D) / xFactor;
			int start = (int) (Math.max(center - support - 1.0E-6D, 0.0D) + 0.5D);
			int stop = (int) (Math.min(center + support, image.getWidth()) + 0.5D);
			double density = 0.0D;
			ContributionInfo[] contribution = new ContributionInfo[stop - start];
			// 该为n1由于代码报错
			for (int n1 = 0; n1 < stop - start; n1++) {
				contribution[n1] = new ContributionInfo(null);
				contribution[n1].pixel = (start + n1);
				contribution[n1].weight = getResizeFilterWeight(scale
						* (start + n1 - center + 0.5D));
				density += contribution[n1].weight;
			}
			if ((density != 0.0D) && (density != 1.0D)) {
				density = 1.0D / density;
				for (int i = 0; i < n; i++) {
					ContributionInfo.access$234(contribution[i], density);
				}
			}
			for (int y = 0; y < resizeImage.getHeight(); y++) {
				double red = 0.0D;
				double green = 0.0D;
				double blue = 0.0D;
				for (int i = 0; i < n; i++) {
					double alpha = contribution[i].weight;
					int rgb = image.getRGB(contribution[i].pixel, y);
					red += alpha * (rgb >> 16 & 0xFF);
					green += alpha * (rgb >> 8 & 0xFF);
					blue += alpha * (rgb & 0xFF);
				}
				int rgb = roundToQuantum(red) << 16
						| roundToQuantum(green) << 8 | roundToQuantum(blue);

				resizeImage.setRGB(x, y, rgb);
			}
		}
	}

	private static double getResizeFilterWeight(double x) {
		double blur = Math.abs(x) / 1.0D;
		double scale = 0.3333333333333333D;
		scale = sinc(blur * scale);
		return scale * sinc(blur);
	}

	private static double sinc(double x) {
		if (x == 0.0D) {
			return 1.0D;
		}
		return Math.sin(3.141592653589793D * x) / (3.141592653589793D * x);
	}

	private static int roundToQuantum(double value) {
		if (value <= 0.0D) {
			return 0;
		}
		if (value >= 255.0D) {
			return 255;
		}
		return (int) (value + 0.5D);
	}

	public static void main(String[] args) throws Exception {
		BufferedImage image = ImageIO.read(new File("d:/1.jpg"));
		ImageIO.write(resizeImage(image, 800, 800), "JPEG", new File(
				"d:/1d800.jpg"));
	}

	private static class ContributionInfo {
		private double weight;
		private int pixel;
		public ContributionInfo(Object object) {
			// TODO Auto-generated constructor stub
		}
		public static void access$234(ContributionInfo contributionInfo,
				double density) {
			// TODO Auto-generated method stub
			
		}
	}
}

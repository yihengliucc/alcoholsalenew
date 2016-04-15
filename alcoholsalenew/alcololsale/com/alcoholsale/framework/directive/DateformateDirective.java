package com.alcoholsale.framework.directive;

import com.alcoholsale.framework.util.DateUtil;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

import java.io.IOException;
import java.io.Writer;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

public class DateformateDirective implements TemplateDirectiveModel {
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		Date date = new Date();
		String timeStr = params.get("time").toString();
		String pattern = params.get("pattern").toString();
		if (!timeStr.equals("now")) {
			if (timeStr.equals("tomorrow")) {
				Calendar cal = Calendar.getInstance();
				cal.add(5, 1);
				date = new Date(cal.getTimeInMillis());
			} else if (timeStr.equals("yesterday")) {
				Calendar cal = Calendar.getInstance();
				cal.add(5, -1);
				date = new Date(cal.getTimeInMillis());
			} else if (timeStr.equals("nextmonth")) {
				Calendar cal = Calendar.getInstance();
				cal.add(2, 1);
				date = new Date(cal.getTimeInMillis());
			} else if (timeStr.equals("prevmonth")) {
				Calendar cal = Calendar.getInstance();
				cal.add(2, -1);
				date = new Date(cal.getTimeInMillis());
			} else {
				long time = Long.valueOf(timeStr).longValue() * 1000L;
				date = new Date(time);
			}
		}
		String str = DateUtil.toString(date, pattern);
		env.getOut().write(str);
	}

	public static void main(String[] args) {
		long num = System.currentTimeMillis() + -1702967296L;

		Calendar cal = Calendar.getInstance();
		cal.add(2, 1);
		long num2 = cal.getTimeInMillis();
		String date = DateUtil.toString(new Date(num2), "yyyy-MM-dd");
		System.out.println(date);
	}
}

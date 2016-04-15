<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<table cellspacing="0" cellpadding="0" border="0" width="100%">
      <tbody>      
          <tr>
            <th><span>商品总数：</span></th>
            <td><span ><a <c:if test="${products.allcount > 0 }"> href="${ctx }/shop/admin/goods!list.do"  class="imp"</c:if>>${ products.allcount}</a>个</span></td>
          </tr>
          <tr>
            <th><span>回收站商品：</span></th>
            <td><span ><a <c:if test="${products.disabledcount > 0 }"> href="${ctx }/shop/admin/goods!trash_list.do"  class="imp"</c:if>>${ products.disabledcount}</a>个</span></td>
          </tr>          
          <tr>
            <th><span>上架商品：</span></th>
            <td><span ><a <c:if test="${products.salecount > 0 }"> href="${ctx }/shop/admin/goods!list.do?market_enable=1"   class="imp"</c:if>>${ products.salecount}</a>个</span></td>
          </tr>
          <tr>
            <th><span>下架商品：</span></th>
            <td><span><a <c:if test="${products.unsalecount> 0 }"> href="${ctx }/shop/admin/goods!list.do?market_enable=0"  class="imp"</c:if>>${ products.unsalecount}</a>个</span></td>
          </tr>
          <tr>
            <th><span>商品评论：</span></th>
            <td><span><a <c:if test="${products.discuss > 0 }"> href="${ctx }/shop/admin/comments!bglist.do?object_type=discuss"  class="imp"</c:if>>${ products.discuss}</a>条</span></td>
          </tr>
          <tr>
            <th><span>商品咨询：</span></th>
            <td><span><a <c:if test="${products.ask> 0 }"> href="${ctx }/shop/admin/comments!bglist.do?object_type=ask"  class="imp"</c:if>>${ products.ask}</a>条</span></td>
          </tr>          
        </tbody>            
 </table>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="container">
   <form method="get" action="./declaration.jsp" class="form-inline mt-3"> 
        <a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고</a>
   </form>
</section>     

    <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelled="modal">  
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="modal" >신고하기</h5>
               <button type="button" class="close" data-dismiss="modal" aria-labelled="close">
                   <span aria-hidden="true">&times;</span>
               </button>    
            </div>
            <div class="modal-body">
                  <form action="./reportAction.jsp" method="post">
                      <div class="form-group">
                          <label>신고 제목</label>
                          <input type="text" name="reportTitle" class="form-control" maxlength="30">
                      </div>
                      <div class="form-group">
                          <label>신고 내용</label>  
                          <textarea name="reportContent" class="form-control" maxlength="2048" style="height:180px"></textarea>
                      </div>   
                      <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="close"></button>
                          <button type=" submit" class="btn btn-danger">신고하기</button>             
            </div>
            </form>
         </div>
      </div>
    </div>
</div>

</body>
</html>
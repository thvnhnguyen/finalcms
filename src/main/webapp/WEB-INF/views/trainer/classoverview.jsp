<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="content">
		<form action="<c:url value='/trainer/manageclass/class-overview'/>"
			id="formSubmit" method="get">
			<div id="breadcrumbs">
				<ul class="breadcrumb">
					<li><a href="">Home</a></li>
					<li><a href="manage-class.html">Manage Class</a></li>
					<li>BHAF-1911-2.2</li>
				</ul>
			</div>
			<c:if test="${not empty message}">
				<div class="alert alert-${alert}">
					<strong>${message}!</strong>
				</div>
	      	</c:if>
			<div id="main-content">
				<div class="right-content">
					<div class="nav-tab">
					<c:url var="createAsmURL" value="/trainer/classoverview/edit" />
						<button class="btn tablink first-tab"
							onclick="openTab(event,'Class-Overview')">Class Overview</button>
						<button class="btn tablink"
							onclick="openTab(event, 'Create-Assignment')">
							<a href='${createAsmURL}'>Create Assignment</a>
						</button>
						<button class="btn tablink"
							onclick="openTab(event, 'Create-Code')">Edit Code</button>
						<button class="btn tablink"
							onclick="openTab(event, 'Manage-Student')">Manage
							Student</button>
					</div>
					<div id="Class-Overview" class="tab-content class-overview">
						<div class="class-info">
							<h3>Class Password :</h3>
							<input type="password" id="codeInput" placeholder="" required
								disabled value="thanh" /><br /> <input
								type="checkbox" name="" id="" onclick="showpassFunc()" /> Show
							Password
						</div>
						<c:forEach var="item" items="${model.listResult}">
							<div class="topic">
								<h1 class="topic-title">Topic 1</h1>
								<c:url var="contentdetailURL" value="/trainer/classoverview/edit">
									<c:param name="asmId" value="${item.asmId}"/>
								</c:url>
								<div class="topic-content">
									<ul>
										<a href="${contentdetailURL}"><i class="fas fa-file-alt"></i><span>${item.asmName}</span></a>
									</ul>
								</div>
							</div>
						</c:forEach>
						<div id="pagination-box">
							<ul class="pagination" id="pagination"></ul>
							<input type="hidden" value="" id="page" name="page" /> <input
								type="hidden" value="" id="limit" name="limit" />
						</div>
					</div>
					<div id="Create-Code" class="tab-content" style="display: none">
						<form action="">
							<h4>Code for Class</h4>
							<input type="password" id="codeInput" placeholder=""
								class="input-info" required /><br /> <input type="checkbox"
								name="" id="" onclick="showpassFunc()" /> Show Password
						</form>
						<button type="submit" class="btn btn-create-code">Update</button>
					</div>				
					<div id="Manage-Student" class="tab-content" style="display: none">
						<div class="table-wrapper">
							<div class="table-title">
								<div class="row">
									<div class="col-sm-6">
										<h2 style="margin-bottom: 5px;">Trainee List</h2>
									</div>
									<!-- <div class="col-sm-6">
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
                                <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>
                            </div> -->
								</div>
							</div>
							<div class="table-content">
								<table class="table table-striped table-hover .w-auto">
									<thead>
										<tr>
											<th>ID</th>
											<th>Name</th>
											<th>DOB</th>
											<th>Email</th>
											<th>Phone</th>
											<th>Class</th>
											<th>Subject</th>
											<th>Grade</th>
											<th>Actions</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>1</td>
											<td>Dany Lo</td>
											<td>15/01/1999</td>
											<td>danybhaf188797@fpt.edu.vn</td>
											<td>0966686371</td>
											<td>BHAF-1911-2.2</td>
											<td>Programming</td>
											<td>8.0</td>
											<td><a href="#editEmployeeModal" class="edit"
												data-toggle="modal"><i class="material-icons"
													data-toggle="tooltip" title="Edit">&#xE254;</i></a> <a
												href="#deleteEmployeeModal" class="delete"
												data-toggle="modal"><i class="material-icons"
													data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>2</td>
											<td>Nguyen Dinh Thanh</td>
											<td>17/05/2000</td>
											<td>thanhndbhaf188797@fpt.edu.vn</td>
											<td>0966686371</td>
											<td>BHAF-1911-2.2</td>
											<td>Programming</td>
											<td>8.0</td>
											<td><a href="#editEmployeeModal" class="edit"
												data-toggle="modal"><i class="material-icons"
													data-toggle="tooltip" title="Edit">&#xE254;</i></a> <a
												href="#deleteEmployeeModal" class="delete"
												data-toggle="modal"><i class="material-icons"
													data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>3</td>
											<td>Le Ngoc Minh</td>
											<td>15/01/2001</td>
											<td>minhlnbhaf188797@fpt.edu.vn</td>
											<td>0966686371</td>
											<td>BHAF-1911-2.2</td>
											<td>Programming</td>
											<td>6.0</td>
											<td><a href="#editEmployeeModal" class="edit"
												data-toggle="modal"><i class="material-icons"
													data-toggle="tooltip" title="Edit">&#xE254;</i></a> <a
												href="#deleteEmployeeModal" class="delete"
												data-toggle="modal"><i class="material-icons"
													data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>4</td>
											<td>Dany Lo</td>
											<td>15/01/1999</td>
											<td>danybhaf188797@fpt.edu.vn</td>
											<td>0966686371</td>
											<td>BHAF-1911-2.2</td>
											<td>Programming</td>
											<td>8.0</td>
											<td><a href="#editEmployeeModal" class="edit"
												data-toggle="modal"><i class="material-icons"
													data-toggle="tooltip" title="Edit">&#xE254;</i></a> <a
												href="#deleteEmployeeModal" class="delete"
												data-toggle="modal"><i class="material-icons"
													data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
										</tr>
										<tr>
											<td>5</td>
											<td>Do Minh Ngoc</td>
											<td>27/07/1998</td>
											<td>ngocdmbhaf188797@fpt.edu.vn</td>
											<td>0966686371</td>
											<td>BHAF-1911-2.2</td>
											<td>Programming</td>
											<td>6.0</td>
											<td><a href="#editEmployeeModal" class="edit"
												data-toggle="modal"><i class="material-icons"
													data-toggle="tooltip" title="Edit">&#xE254;</i></a> <a
												href="#deleteEmployeeModal" class="delete"
												data-toggle="modal"><i class="material-icons"
													data-toggle="tooltip" title="Delete">&#xE872;</i></a></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- Pagination -->
							<div class="clearfix">
								<div class="hint-text">
									Showing <b>5</b> out of <b>100</b> entries
								</div>
								<div class="pagination">
									<a href="#">&laquo;</a> <a class="active" href="#">1</a> <a
										href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
									<a href="#">6</a> <a href="#">&raquo;</a>
								</div>
							</div>
							<!-- End Pagination -->
						</div>
						<!-- Edit Modal HTML -->
						<div id="editEmployeeModal" class="modal fade">
							<div class="modal-dialog">
								<div class="modal-content">
									<form>
										<div class="modal-header">
											<h4 class="modal-title">Edit Trainee</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label>Name</label> <input type="text" class="form-control"
													required />
											</div>
											<div class="form-group">
												<label>Date of Birth</label> <input type="date"
													class="form-control" required />
											</div>
											<div class="form-group">
												<label>Phone</label> <input type="text" class="form-control"
													required />
											</div>
											<div class="form-group">
												<label>Grade</label> <input type="text" class="form-control"
													required />
											</div>
										</div>
										<div class="modal-footer">
											<input type="button" class="btn btn-default"
												data-dismiss="modal" value="Cancel" /> <input type="submit"
												class="btn btn-info" value="Save" />
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- Delete Modal HTML -->
						<div id="deleteEmployeeModal" class="modal fade">
							<div class="modal-dialog">
								<div class="modal-content">
									<form>
										<div class="modal-header">
											<h4 class="modal-title">Delete Trainee</h4>
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
										</div>
										<div class="modal-body">
											<p>Are you sure you want to delete these Records?</p>
											<p class="text-warning">
												<small>This action cannot be undone.</small>
											</p>
										</div>
										<div class="modal-footer">
											<input type="button" class="btn btn-default"
												data-dismiss="modal" value="Cancel" /> <input type="submit"
												class="btn btn-danger" value="Delete" />
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="sidebar">
					<div id="calendar">
						<div class="calendar-title">
							<i class="fas fa-calendar-alt"></i><span>Calendar</span>
						</div>
						<div class="wrapper">
							<div id="calendari"></div>
						</div>
					</div>
					<div class="events">
						<div class="events-title">
							<i class="fas fa-calendar-check"></i><span>Events</span>
						</div>
						<div>
							<div class="panel panel-danger">
								<div class="panel-heading">
									<h3 class="panel-title">
										<span class="glyphicon glyphicon-calendar"></span>  Calendar
										Events
									</h3>
								</div>
								<div class="panel-body">
									<ul class="media-list">
										<li class="media">
											<div class="media-left">
												<div class="panel panel-danger text-center date">
													<div class="panel-heading month">
														<span class="panel-title strong"> Mar </span>
													</div>
													<div class="panel-body day text-danger">23</div>
												</div>
											</div>
											<div class="media-body">
												<h4 class="media-heading">Assignment 1</h4>
												<p>Due : Saturday, 23 January 2021, 11:59 PM</p>
											</div>
										</li>
										<li class="media">
											<div class="media-left">
												<div class="panel panel-danger text-center date">
													<div class="panel-heading month">
														<span class="panel-title strong"> Jan </span>
													</div>
													<div class="panel-body text-danger day">16</div>
												</div>
											</div>
											<div class="media-body">
												<h4 class="media-heading">Assignment 1</h4>
												<p>Due : Saturday, 23 January 2021, 11:59 PM</p>
											</div>
										</li>
										<li class="media">
											<div class="media-left">
												<div class="panel panel-danger text-center date">
													<div class="panel-heading month">
														<span class="panel-title strong all-caps"> Dec </span>
													</div>
													<div class="panel-body text-danger day">8</div>
												</div>
											</div>
											<div class="media-body">
												<h4 class="media-heading">Assignment 1</h4>
												<p>Due : Saturday, 23 January 2021, 11:59 PM</p>
											</div>
										</li>
									</ul>
									<a href="#" class="btn btn-default btn-block">More Events »</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script>
		var totalPages = $
		{
			model.totalPage
		};
		var currentPage = $
		{
			model.page
		};
		$(function() {
			window.pagObj = $('#pagination').twbsPagination({
				totalPages : totalPages,
				visiblePages : 3,
				startPage : currentPage,
				onPageClick : function(event, page) {
					if (currentPage != page) {
						$('#limit').val(4);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
				}
			});
		});

		$('#btnAddOrUpdateAsm').click(function(e) {
			e.preventDefault();
			var formData = $('#formSubmitAsm').serializeArray();
			console.log(formData);
		});
	</script>
</body>
</html>
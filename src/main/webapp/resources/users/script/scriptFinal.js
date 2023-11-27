var containerMain = $(".container");
var page;
var previous;
var index_page;
var next_page;
var viewListEmp;
var submitSearch;
var searchValue;
var filterValue;
var contentView = $(".view_content");


var manager = $(".manager")
var contentChoice = $(".choice")

manager.on("click", function() {
    contentChoice.toggle();
});

////

var transferEmployeelist = function(){
    let viewStr = `
    <div class="title">
        <p>Employee List</p>
    </div>

    <div class="search_user" >
        <div class="search">
                        <span class="icon_search">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </span>
            <input
                id="search_value"
                type="search"
                name="search"
                placeholder="User search"
            />
        </div>

        <div class="filter">
                        <span class="icon_search">
                            <i class="fa-solid fa-filter"></i>&nbsp;
                            <span>Filter by</span>
                        </span>
            <select id="filter_value" name="searchField">
                <option selected value="">-- Select --</option>
                <option  value="address">Address</option>
                <option  value="phoneNumber">Phone number</option>
                <option  value="department">Department</option>
                <option  value="name">Name</option>
                
            </select>
        </div>


        <button class="submit_search">Search</button>

    </div>

    <table id="content_table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Date of birth</th>
            <th>Address</th>
            <th>Phone number</th>
            <th>Department</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody id="view_list_emp">
        
        </tbody>

    </table>
<!--    <p style="font-size: 20px; color:  #0428e0; font-weight: 500;"><span class="totalResult">5</span> result</p>-->

    <div class="page">
        <span class="previous">Previous</span>
        <span class="index_page">1</span>
        <span class="next_page">Next</span>
    </div>
    `
    containerMain.html(viewStr);
    searchValue = $("#search_value");
    filterValue = $("#filter_value");
    viewListEmp = $("#view_list_emp");
    submitSearch = $(".submit_search");
    page = $(".page");
    previous = $(".previous");
    index_page = $(".index_page");
    next_page = $(".next_page");
    viewlist();

    previous.on("click", reduceIndex);
    next_page.on("click", increaseIndex);
    submitSearch.on("click", viewListSearch);

}

var reduceIndex = function() {
    let numberValue = parseInt(index_page.text());
    if(numberValue > 1 ){
        index_page.text(numberValue - 1);
    } else {
        index_page.text(1);
    }
    viewlist();
}


var increaseIndex = function() {
    let numberValue = parseInt(index_page.text());
    index_page.text(numberValue + 1)
    viewlist();

}

var viewlist = function () {
    let value = {
        "searchValue" : searchValue.val(),
        "filterValue" : filterValue.val(),
        "numberValue" : index_page.text()
    }
    $.ajax({
        url: "../employee/search", // Đường dẫn tới tài nguyên hoặc API bạn muốn truy cập
        method: "GET", // Ví dụ: "GET", "POST", "PUT", "DELETE"
        data: value, // Dữ liệu gửi kèm với yêu cầu (nếu cần)
        data_type: "text",
        success: function (data) {
            console.log(data);
            if (data === "") {
                index_page.text(parseInt(index_page.text()) - 1)
                console.log("thoi dung di")
                viewlist();
            }
            viewListEmp.html(data);

        },
        error: function (e) {
            console.log("error")
            console.log(e);
        }
    })
}

var viewListSearch = function () {
    let value = {
        "searchValue" : searchValue.val(),
        "filterValue" : filterValue.val(),
        "numberValue" : 1
    }
    index_page.text(1);
    $.ajax({
        url: "../employee/search", // Đường dẫn tới tài nguyên hoặc API bạn muốn truy cập
        method: "GET", // Ví dụ: "GET", "POST", "PUT", "DELETE"
        data: value, // Dữ liệu gửi kèm với yêu cầu (nếu cần)
        data_type: "text",
        success: function (data) {
            console.log(data);
            viewListEmp.html(data);
        },
        error: function (e) {
            console.log("error")
            console.log(e);
        }
    })
}

contentView.on("click", transferEmployeelist);
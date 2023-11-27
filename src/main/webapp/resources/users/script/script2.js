var containerMain = $(".container");
var viewContent = $(".view_content");
var formContent = $(".form_content");
var userChoice = $(".user_choice");
var userBox = $(".user_box");
var userProfile = $(".user_profile");
var manager = $(".manager")
var contentChoice = $(".choice")
var searchValue;
var filterValue;
var viewListEmp;

var loadStr = `
        <div class="title">
            <h2>Loading</h2>
        </div>

    `

var page = $(".page");
var previous = $(".previous");
var index_page = $(".index_page");
var next_page = $(".next_page");

var reduceIndex = function() {
    let numberValue = parseInt(index_page.text());
    if(numberValue > 1 ){
        index_page.text(numberValue - 1);
    } else {
        index_page.text(1);
    }
}

var increaseIndex = function() {
    let numberValue = parseInt(index_page.text());
    index_page.text(numberValue + 1);
}

previous.on("click", reduceIndex);
next_page.on("click", increaseIndex);


// // // Hàm chuyển sang Employee list
// // var transferEmployeelist = function(){
// //     let viewStr = `
// //     <div class="title">
// //                     <p>Employee List</p>
// //                 </div>
// //
// //                 <div class="search_user" action="" method="post">
// //                     <div class="search">
// //                         <span class="icon_search">
// //                             <i class="fa-solid fa-magnifying-glass"></i>
// //                         </span>
// //                         <input
// //                             id="search_value"
// //                             type="search"
// //                             name="search"
// //                             placeholder="User search"
// //                         />
// //                     </div>
// //
// //                     <div class="filter">
// //                         <span class="icon_search">
// //                             <i class="fa-solid fa-filter"></i>&nbsp;
// //                             <span>Filter by</span>
// //                         </span>
// //                          <select id="filter_value" name="searchField">
// //                            <option selected value="">-- Select --</option>
// //                            <option  value="address">Address</option>
// //                            <option  value="phoneNumber">Phone number</option>
// //                            <option  value="department">Department</option>
// //                            <option  value="name">Name</option>
// //                          </select>
// //                     </div>
// //
// //
// //                     <button class="submit_search" onclick="searchEmp()">Search</button>
// //
// //                 </div>
// //
// //                 <table id="content_table">
// //                     <thead>
// //                             <tr>
// //                                 <th>ID</th>
// //                                 <th>Name</th>
// //                                 <th>Date of birth</th>
// //                                 <th>Address</th>
// //                                 <th>Phone number</th>
// //                                 <th>Department</th>
// //                                 <th>Action</th>
// //                             </tr>
// //                     </thead>
// //                     <tbody id="view_list_emp">
// //
// //                     </tbody>
// //                 </table>
// //
// //                 <div class="page">
// //                     <span class="previous">Previous</span>
// //                     <span class="index_page">1</span>
// //                     <span class="next_page">Next</span>
// //                 </div>
// //     `
// //     containerMain.html(loadStr);
// //     setTimeout(function() {
// //         containerMain.html(viewStr);
// //         searchValue = $("#search_value");
// //         filterValue = $("#filter_value");
// //         viewListEmp = $("#view_list_emp");
// //
// //         searchEmp();
// //     }, 2000);
// //
// // }
// // const searchEmp = function () {
// //
// //     previous = $(".previous");
// //     index_page = $(".index_page");
// //     next_page = $(".next_page");
// //
// //     let reduceIndex = function() {
// //         console.log("hahaha -")
// //         let numberValue = parseInt(index_page.text());
// //         if(numberValue > 1 ){
// //             index_page.text(numberValue - 1);
// //         } else {
// //             index_page.text(1);
// //         }
// //     }
// //
// //     let increaseIndex = function() {
// //         console.log("hahaha +")
// //         let numberValue = parseInt(index_page.text());
// //         index_page.text(numberValue + 1);
// //     }
// //
// //     previous.on("click", reduceIndex);
// //     next_page.on("click", increaseIndex);
// //
// //     console.log("hahaha")
// //     let value = {
// //         "searchValue" : searchValue.val(),
// //         "filterValue" : filterValue.val()
// //     }
// //     $.ajax({
// //         url: "http://localhost:8080/Management_Employee_war/cms/search", // Đường dẫn tới tài nguyên hoặc API bạn muốn truy cập
// //         method: "POST", // Ví dụ: "GET", "POST", "PUT", "DELETE"
// //         data: value, // Dữ liệu gửi kèm với yêu cầu (nếu cần)
// //         dataType: "text", // Ví dụ: "json", "xml", "html", "text"
// //         success: function (data) {
// //             console.log(data);
// //             viewListEmp.html(data);
// //         },
// //         error: function (e) {
// //             console.log("error")
// //             console.log(e);
// //         }
// //     });
//     // $.post("http://localhost:8080/Management_Employee_war/cms/search",{mess: ""},"json").done((data) => {
//     //     console.log(data);
//     //     viewListEmp.html(data);
//     // })
// }
//
// // Click chọn chuyển sang Employee list
// // viewContent.on("click", transferEmployeelist);








// Hàm chuyển sang user Profile
var transferUserProfile = function(){
    let profileStr = `
        <div class="title">
            <p>Edit Profile</p>
        </div>
        <div class="container_form">
            <div class="title_form">
                <span>Profile From Elements</span>
            </div>
            <form class="form_info">
            <fieldset>
            <label for="firstName">First Name</label> <br />
            <input
                class="input"
                type="text"
                id="firstName"
                name="firstName"
                required
                placeholder="Enter the first name"
                minlength="3"
                maxlength="30"
            />
            <br />

            <label for="lastName">Last Name</label> <br />
            <input
                class="input"
                type="text"
                id="lastName"
                name="lastName"
                required
                placeholder="Enter the last name"
                minlength="3"
                maxlength="30"
            />
            <br />

            <label for="email">Email</label> <br />
            <input
                class="input"
                type="email"
                id="email"
                name="email"
                required
                placeholder="your_email@example.com"
                minlength="5"
                maxlength="50"
            />
            <br />

            <label for="phone">Phone</label> <br />
            <input
                class="input"
                type="tel"
                id="phone"
                name="phone"
                required
                placeholder="Enter your phone number"
                minlength="9"
                maxlength="13"
            />
            <br />

            <label for="desc">Description</label> <br />
            <textarea name="desc" id="desc" rows="3" maxlength="200"></textarea>
            <br />
            </fieldset>
                <input class="btn" type="submit" value="Submit Button" />
                <input class="btn" type="reset" value="Reset Button" />
            </form>
        </div>
    `
    let loadStr = `
        <div class="title">
            <h2>Loading</h2>
        </div>

    `
    containerMain.html(loadStr);
    setTimeout(function() {
        containerMain.html(profileStr);
    }, 2000);
}

// Click chọn chuyển sang user Profile
userProfile.on("click", transferUserProfile);

// Hàm chuyển sang add employee
var transferFormContent = function(){
    let formStr = `
        <div class="title">
            <p>Add Employee</p>
        </div>
        <div class="container_form">
            <div class="title_form">
                <span>Information employee</span>
            </div>
            <form class="form_info">
                <fieldset>

                    <label for="firstName">First Name</label> <br />
                    <input
                        class="input"
                        type="text"
                        id="firstName"
                        name="firstName"
                        required
                        placeholder="Enter the first name"
                        minlength="3"
                        maxlength="30"
                    />
                    <br />

                    <label for="lastName">Last Name</label> <br />
                    <input
                        class="input"
                        type="text"
                        id="lastName"
                        name="lastName"
                        required
                        placeholder="Enter the last name"
                        minlength="3"
                        maxlength="30"
                    />
                    <br />

                    <label for="phone">Phone Number</label> <br />
                    <input
                        class="input"
                        type="tel"
                        id="phone"
                        name="phone"
                        required
                        placeholder="Enter your phone number"
                        minlength="9"
                        maxlength="13"
                    />
                    <br />

                    <label for="dob">Date of birth</label> <br />
                    <input
                        class="input"
                        type="date"
                        id="dob"
                        name="dob"
                        required
                    />
                    <br />

                    <label>Gender</label> <br />
                    <div class="gender_box">
                        <label class="gender" for="male">Male</label>
                        <input type="radio" name="gender" id="male" checked value="1">
                        <label class="gender" for="female">Female</label>
                        <input type="radio" name="gender" id="female" value="0">
                    </div>

                    <label for="account">Account</label> <br />
                    <input
                        class="input"
                        type="text"
                        id="account"
                        name="account"
                        required
                        placeholder="Enter the last name"
                        minlength="3"
                        maxlength="30"
                    />
                    <br />

                    <label for="email">Email</label> <br />
                    <input
                        class="input"
                        type="email"
                        id="email"
                        name="email"
                        required
                        placeholder="your_email@example.com"
                        minlength="5"
                        maxlength="50"
                    />
                    <br />

                    <label for="password">Password</label> <br />
                    <input
                        class="input"
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Password"
                        minlength="8"
                        maxlength="30"
                        required
                    /><br/>

                    <label for="address">Address</label> <br />
                    <textarea name="address" id="address" rows="2"></textarea>
                    <br />


                    <label>Status</label> <br />
                    <div class="gender_box">
                        <label class="gender" for="status">Active</label>
                        <input type="checkbox" name="status" id="status" checked>
                    </div>

                    <label for="department">Department</label> <br />
                    <select class="input" id="department" name="department" required>
                        <option value="FA">Fsoft Academy</option>
                        <option value="FA">Fsoft marketing</option>
                    </select>
                    <br />

                    <label for="remark">Remark</label> <br />
                    <textarea name="remark" id="remark" rows="5"></textarea>
                    <br />

                </fieldset>
                <input class="btn" type="submit" value="ADD" />
                <input class="btn" type="reset" value="Reset " />
            </form>
        </div>
        <br /><br /><br /><br />
        `
    let loadStr = `
        <div class="title">
            <h2>Loading</h2>
        </div>

    `
    containerMain.html(loadStr);
    setTimeout(function() {
        containerMain.html(formStr);
    }, 2000);
}

// Click chọn chuyển sang add employee
formContent.on("click", transferFormContent);


// Click chọn để hiện

// userChoice.on("click", function() {
//     userBox.toggle("slow");
// });

var toggleFlag = false;
userChoice.on("click", function() {
    if (toggleFlag) {
        userChoice.css({backgroundColor: "transparent"})
        userBox.hide("slow");
    } else {
        userChoice.css({backgroundColor: "#ccc"})
        userBox.show("slow");
    }
    toggleFlag = !toggleFlag;
});

manager.on("click", function() {
    contentChoice.toggle();
});

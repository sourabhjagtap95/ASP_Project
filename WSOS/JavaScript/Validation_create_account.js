

function formValidation() {
    var date = document.student_registration.date;
    var month = document.student_registration.month;
    var year = document.student_registration.year;
    var division = document.student_registration.division;
    var username = document.student_registration.username;
    var firstname = document.student_registration.firstname;
    var lastname = document.student_registration.lastname;
    var password = document.student_registration.password;
    var confirm_password = document.student_registration.confirm_password;
    var email = document.student_registration.email;
    var mobile = document.student_registration.mobile;
    if (firstname_validation(firstname)) {
        if (lastname_validation(lastname)) {
            if (username_validation(username)) {
                if (password_validation(password)) {
                    if (check_pass(password, confirm_password)) {
                        if (check_dob(date, month, year)) {
                            if (check_class(division)) {
                                if (email_validation(email)) {
                                    if (check_mobile(mobile)) {
                                        return true;
                                    }
                                }

                            }
                        }
                    }

                }
            }
        }
    }
    return false;
}

function firstname_validation(firstname) {
    var format = /^[A-Za-z]+$/;
    if (firstname.value.match(format)) {
        return true;
    }
    else {
        alert("First Name must be a valid name");
        firstname.focus();
        return false;
    }
}

function lastname_validation(lastname) {
    var format = /^[A-Za-z]+$/;
    if (lastname.value.match(format)) {
        return true;
    }
    else {
        alert("Last Name must be a valid name");
        lastname.focus();
        return false;
    }
}

function username_validation(username) {
    var format = /^[A-Za-z][A-Za-z0-9_@]{4,9}$/;
    var wrong = /^[0-9_@]+$/;
    if (username.value.match(wrong)) {
        alert("User Name should start with atleast with one alphabet");
        username.focus();
        return false;
    }
    if (!username.value.match(format)) {
        if (username.value.length >= 5 && username.value.length <= 10) {
            var symformat = /^[_@]$/;
            if (!username.value.match(symformat)) {
                alert("User Name can contain only _ or @ symbols.");
                username.focus();
                return false;
            }

        }
        else {
            alert("User Name should be between 5 to 10 characters");
            username.focus();
            return false;

        }
    }
    else {

        return true;
    }
}

function password_validation(password) {
    var format = /^[A-Za-z0-9_@]{5,10}$/;
    if (!password.value.match(format)) {
        if (password.value.length >= 5 && password.value.length <= 10) {
            var symformat = /^[_@]$/;
            if (!password.value.match(symformat)) {
                alert("Password can contain only _ or @ symbols.");
                password.focus();
                return false;
            }

        }
        else {
            alert("Password should be between 5 to 10 characters");
            password.focus();
            return false;

        }
    }
    else {
        return true;
    }
}

function check_pass(password, confirm_password) {
    if (confirm_password.value == password.value) {
        return true;
    }
    else {
        alert("Passwords do not match.Check your Caps lock key.");
        confirm_password.focus();
        return false;
    }
}

function check_dob(date, month, year) {
    if (document.getElementsByName('date')[0].value == 'dateblank') {
        alert("Please Select Birth Date");
        date.focus();
        return false;
    }

    else if (document.getElementsByName('month')[0].value == 'monthblank') {
        alert("Please Select Birth Month");
        month.focus();
        return false;
    }

    else if (document.getElementsByName('year')[0].value == 'yearblank') {
        alert("Please Select Birth Year");
        year.focus();
        return false;
    }
    return true;
}


function check_class(division) {

    if (document.getElementsByName('division')[0].value == 'blank4') {
        alert("Please Select Division");
        division.focus();
        return false;
    }
    return true;
}

function email_validation(email) {
    //    var format = /^[a-z0-9._-]+@[a-z]+.[a-z.]{2,5}+$/;
    var format = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    if (email.value.match(format)) {
        return true;
    }
    else {
        alert("Enter a valid email address (e.g someone@example.com)");
        email.focus();
        return false;
    }
}

function check_mobile(mobile) {
    var numbers = /^[0-9]{10}$/;
    var plus = /^(\+91-|\+91|0)?\d{10}$/;
    if (mobile.value.match(numbers) || mobile.value.match(plus)) {
        return true;
    }
    else {
        alert('Mobile must be a valid number');
        mobile.focus();
        return false;
    }
}

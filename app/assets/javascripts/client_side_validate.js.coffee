show_message = (elem, msg, type) ->
  class_type = ""
  class_type = "alert alert-" + type  unless type is ""
  $(elem).html(msg).attr("class", class_type).show()
  setTimeout (->
    $(elem).fadeOut()
    return
  ), 9000
  return
$ ->
  show_message = (elem, msg, type) ->
    class_type = ""
    class_type = "alert alert-" + type  unless type is ""
    $(elem).html(msg).attr("class", class_type).show()
    setTimeout (->
      $(elem).fadeOut()
      return
    ), 9000
    return
  $("input[type='text']").blur ->
    $(this).val $.trim($(this).val())
    return

$ ->    
  # validator rules
  validator = $("#new_user").validate(
    # errorClass: "alert-danger"
    errorElement: "div"
    rules:
      "user[email]":
        required: true
        email: true

      "user[password]":
        required: true
        minlength: 8

    messages:
      email:
        required: "Please enter a email"
        email: "Please enter a valid email address"

      password:
        required: "Please enter a password"
        minlength: "Your password must be at least 8 characters long"
  )

$ ->    
  # validator rules
  validator = $("#signup_form, #resend_form").validate(
    # errorClass: "alert-danger"
    errorElement: "div"
    rules:
      "user[email]":
        required: true
        email: true
        remote: "/check_valid_email"

    messages:
      email:
        required: "Please enter a email"
        email: "Please enter a valid email address"
  )

$ ->    
  # validator rules
  validator = $("#forgot_form ").validate(
    # errorClass: "alert-danger"
    errorElement: "div"
    rules:
      "user[email]":
        required: true
        email: true
        remote: "/check_valid_email"

    messages:
      email:
        required: "Please enter a email"
        email: "Please enter a valid email address"
  )

$ ->    
  # validator rules
  validator = $("#create-password").validate(
    # errorClass: "alert-danger"
    errorElement: "div"
    rules:
      "user[password]":
        required: true
        minlength: 8

      "user[password_confirmation]":
        required: true
        minilength: 8
        equalTo: "#user_password"

    messages:
      password:
        required: "Please enter a password"
        minlength: "Your password must be at least 8 characters long"

      "user[password_confirmation]":
        equalTo: "Password confirmation doesn't match the password."
        required: "Please enter a password"
        minlength: "Your password must be at least 8 characters long"
  )

$ ->    
  # validator rules
  validator = $("#upload_form ").validate(
    # errorClass: "alert-danger"
    errorElement: "div"
    rules:
      "upload[name]":
        required: true

      "upload[file]":
        required: true
  )

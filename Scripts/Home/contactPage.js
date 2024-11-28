$("#selContactSubject").on("change", function () {
    var selected = $(this).find(":selected").text();
    $("#contactSubject").val(selected);
})

$("#inquireBtn").on("click", function () {
    var data = {
        'name': $("#contactName").val(),
        'subject': $("#contactSubject").val(),
        'message': $("#contactMessage").val()
    }

    $.ajax({
        type: 'post',
        url: 'addInquiries',
        data: data,
        async: true,
        success: function (response) {
            alert(response);
        }
    });
})
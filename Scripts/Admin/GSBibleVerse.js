
function addBibleVerse() {
    if (validateBibleVerse() == false) {
        return false;
    }

    KTApp.block('#GSBibleVerse', {
        overlayColor: '#000000',
        state: 'secondary',
        message: 'Loading...'
    });

    var data = {
        'bible_verse': $("#bible_verse").val(),
        'bible_passage': $("#bible_passage").val(),
    }

    $.ajax({
        type: 'post',
        url: 'Admin/addBibleVerse',
        data: data,
        async: true,
        success: function (response) {
            KTApp.unblock('#GSBibleVerse');
            var result = JSON.parse(response)
            if (result[0].result == "success") {
                Swal.fire({
                    title: "Success!",
                    text: "Action Submitted",
                    buttonsStyling: true,
                    confirmButtonText: "Okay",
                    confirmButtonColor: '#3D8EEE',
                    icon: "success",
                    iconColor: '#3D8EEE'
                }).then(function (result) {
                    window.location.href = "Admin/GSBibleVerse";
                });
            }
            else {
                Swal.fire({
                    title: "Error!",
                    text: response,
                    buttonsStyling: true,
                    confirmButtonText: "Okay",
                    confirmButtonColor: '#3D8EEE',
                    icon: "error",
                    iconColor: '#3D8EEE'
                })
            }
            
        }
    })
}

function validateBibleVerse() {
    var errors = []
    var inputs = ["bible_verse", "bible_passage"]
    var verse = $("#bible_verse").val()
    var passage = $("#bible_passage").val()

    if (verse.length == 0) {
        $('#errorVerse').html('This field is required.')
        errors.push("bible_verse")
    }
    else {
        $('#errorVerse').html('')
    }

    if (passage.length == 0) {
        $('#errorPassage').html('This field is required.')
        errors.push("bible_passage")
    }
    else {
        $('#errorPassage').html('')
    }

    for (let i = 0; i < inputs.length; i++) {
        $("#" + inputs[i]).removeClass("border border-danger");
    }

    if (errors.length > 0) {
        for (let i = 0; i < errors.length; i++) {
            $("#" + errors[i]).addClass("border border-danger");
        }
        return false;
    }
    else { 
        return true;
    }
}

function addProductCategory() {
    var data = {
        'api_pc_name': $("#html_pc_name").val(),
        'api_pc_description': $("#html_pc_description").val()
    }

    $.ajax({
        type: 'post',
        url: 'Product/addProductCategoryAPI',
        data: data,
        async: false,
        success: function (response) {
            alert(response);
        }
    })
}

function addProductSubCategory() {
    var data = {
        'api_pc_id': $("#html_pc_id").val(),
        'api_psc_name': $("#html_psc_name").val(),
        'api_psc_description': $("#html_psc_description").val()
    }

    $.ajax({
        type: 'post',
        url: 'Product/addProductSubCategoryAPI',
        data: data,
        async: false,
        success: function (response) {
            alert(response);
        }
    })
}

function addProduct() {
    var data = {
        'api_prod_sub_cat_id': $("#html_prod_sub_cat_id").val(),
        'api_prod_name': $("#html_prod_name").val(),
        'api_prod_description': $("#html_prod_description").val()
    }

    $.ajax({
        type: 'post',
        url: 'Product/addProductAPI',
        data: data,
        async: false,
        success: function (response) {
            alert(response);
        }
    })
}
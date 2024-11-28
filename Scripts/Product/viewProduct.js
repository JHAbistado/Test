getProduct();
getProductCategory();
getProductSubCategory();
function getProduct() {
    $.ajax({
        type: 'get',
        url: 'Product/getProductAPI',
        async: false,
        success: function (response) {
            var result = JSON.parse(response);

            var displayData = result.map((object) => {
                const { p_id, psc_id, p_name, p_description, psc_name } = object

                return `
                    <tr>
                        <td>${p_id}</td>
                        <td>${psc_id}</td>
                        <td>${psc_name}</td>
                        <td>${p_name}</td>
                        <td>${p_description}</td>
                    </tr>
                `
            }).join();

            $("#productTable tbody").html(displayData);
        }
    })
}

function getProductCategory() {
    $.ajax({
        type: 'get',
        url: 'Product/getProductCategoryAPI',
        async: false,
        success: function (response) {
            var result = JSON.parse(response);

            var displayData = result.map((object) => {
                const { pc_id, pc_name, pc_description } = object

                return `
                    <tr>
                        <td>${pc_id}</td>
                        <td>${pc_name}</td>
                        <td>${pc_description}</td>
                    </tr>
                `
            }).join();

            $("#productCategoryTable tbody").html(displayData);
        }
    })
}

function getProductSubCategory() {
    $.ajax({
        type: 'get',
        url: 'Product/getProductSubCategoryAPI',
        async: false,
        success: function (response) {
            var result = JSON.parse(response);

            var displayData = result.map((object) => {
                const { psc_id, pc_id, pc_name, psc_name, psc_description } = object

                return `
                    <tr>
                        <td>${psc_id}</td>
                        <td>${pc_id}</td>
                        <td>${pc_name}</td>
                        <td>${psc_name}</td>
                        <td>${psc_description}</td>
                    </tr>
                `
            }).join();

            $("#productSubCategoryTable tbody").html(displayData);
        }
    })
}

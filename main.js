let getAll = (urlAPI) => {
    $.ajax({
        type: 'GET',
        url: urlAPI,
        contentType: 'application/json',
        async: true,
        success: function (data) {            
            transList(data);

        },
        error: function(error) {
            console.log(error)
        }
    })
}

let deleteItem = (urlAPI) => {
    $.ajax({
        type: 'DELETE',
        url: urlAPI,
        contentType: 'application/json',
        success: function (data) {            
            transList(data);

        },
        error: function(error) {
            console.log(error)
        }
    })
}

$(document).ready(function ($){
    getAll('http://localhost/src/transaction.php');
    // getAll('http://localhost/src/user.php');
    // getAll('http://localhost/src/category.php');
})

function transList(ArregloTransacciones) {
    let i = 0;
    let total = 0;
    while (i < ArregloTransacciones.length) {
        console.log(ArregloTransacciones[i].amount)
        $("#lista").append(
        '<li class="list-group-item d-flex justify-content-between align-items-center">' +
        ArregloTransacciones[i].description +
            '<span class="badge bg-success"> $' +
            ArregloTransacciones[i].amount +
            '</span>' +
            '<button onclick="'+
            deleteButton(ArregloTransacciones[i].id) +
            '" class="btn btn-danger" >DELETE</button>' +
        '</li>'
        );
        total = total + parseInt(ArregloTransacciones[i].amount);
        i++;
    }
    $("#total").append('$' + total);
}

function deleteButton(idTransaction) {
    console.log('ALOOOOO');
    let urlDelete = 'http://localhost/src/transaction.php?id=' + idTransaction;
    deleteItem(urlDelete)
}

//* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
    dropdown[i].addEventListener("click", function () {
        this.classList.toggle("active");
        var dropdownContent = this.nextElementSibling;
        if (dropdownContent.style.display === "block") {
            dropdownContent.style.display = "none";
        } else {
            dropdownContent.style.display = "block";
        }
    });
}

function addIngredientstoMeal(mealId){
    var ingredientsIDs = [];
    $('input[name="selection[]"]:checked').each(function() {
        if(ingredientsIDs!="")
            ingredientsIDs.push(this.value)
        else
            ingredientsIDs[0] = this.value;
    });
    /*for (var i=0; i<ingredientsIDs.length;i++)
    {
        $.ajax({
            type: "POST",
            url: 'http://localhost/healthify/backend/web/index.php?r=mealplaner%2Fadd&ingredientsIDs='+ingredientsIDs[i]+'&mealId='+mealId,
            data: $('#' + 'grid').serialize(),
            cache: false,
            dataType: 'html',
            success: function (result) {
                if (result == '200') {
                    alert('Ingredientes inseridos');
                }
                else {
                    alert('some error occured: '+result);
                }
            }
        });
    }*/
    $.ajax({
        type: "POST",
            url: 'http://localhost/healthify/backend/web/index.php?r=mealplaner%2Fadd&ingredientsIDs='+ingredientsIDs+'&mealId='+mealId,
        data: $('#' + 'grid').serialize(),
        cache: false,
        dataType: 'html',
        success: function (result) {
            if (result == '200') {
                alert('successfuly inserted');
            }
            else {
                alert('some error occured: '+result);
            }
        }
    });
}

function pesquisa(){
    var valorPesquisa = $('#idPesquisa').val();
    reload();
    var apiKey = 'GiK7y+Gve0eExGd5SaB6QA==TewdC6kAdnR9dj6V';
    if (valorPesquisa!=="") {
        $.ajax({
            method: 'GET',
            url: 'https://api.calorieninjas.com/v1/nutrition?query=' + valorPesquisa,
            headers: { 'X-Api-Key': apiKey},
            contentType: 'application/json',
            success: function(result) {
                document.getElementById('ingredients-name').value=result['items'][0]['name'];
                document.getElementById('ingredients-calories').value=result['items'][0]['calories'];
                document.getElementById('ingredients-carbohydrates_total_g').value=result['items'][0]['carbohydrates_total_g'];
                document.getElementById('ingredients-fat_saturated_g').value=result['items'][0]['fat_saturated_g'];
                document.getElementById('ingredients-fat_total_g').value=result['items'][0]['fat_total_g'];
                document.getElementById('ingredients-fiber_g').value=result['items'][0]['fiber_g'];
                document.getElementById('ingredients-protein_g').value=result['items'][0]['protein_g'];
                document.getElementById('ingredients-sugar_g').value=result['items'][0]['sugar_g'];
                document.getElementById('ingredients-cholesterol_mg').value=result['items'][0]['cholesterol_mg'];
            },
            error: function ajaxError(jqXHR) {
                console.error('Error: ', jqXHR.responseText);
            }
        });
    }
}
function reload(){
    var container = document.getElementById("tableIngredients");
    var content = container.innerHTML;
    container.innerHTML= content;
}
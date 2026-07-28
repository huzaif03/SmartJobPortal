/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const search = document.getElementById("search");
search.addEventListener("keyup", function () {
    let value = this.value.toLowerCase();
    let rows = document.querySelectorAll("#workerTable tbody tr");
    rows.forEach(function(row){
        let text = row.textContent.toLowerCase();
        if(text.includes(value)){
            row.style.display = "";
        }
        else{
            row.style.display = "none";
        }
    });
});
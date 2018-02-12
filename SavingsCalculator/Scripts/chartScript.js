draw = function (chartType, mEarn, tax, living, transport, hobbies, total, leftover) {
    
    if (mEarn == "0" && tax == "0" && living === "0" && transport === "0" && hobbies === "0" && act === "0" && spending === "0" && misc === "0") {
        document.getElementById("lblChartType").style.display = "none";
        document.getElementById("DropDownList1").style.display = "none";
        document.getElementById("chartPlaceholder").style.display = "none";
        document.getElementById("noDataPlaceholder").textContent = "Not enough data to draw chart";
    } else {
        var chart = new CanvasJS.Chart("chartContainer", {
            backgroundColor: "rgba(160, 32, 240, 0)",
            title: {
                fontColor: "#fff",
                text: "Total Monthly: £" + mEarn,
            },
            animationEnabled: true, //disable here

            data: [
        {
            // Change type to "doughnut", "line", "splineArea", etc.
            type: chartType,
            dataPoints: [
                    { label: "Total Expense", y: parseFloat(total), indexLabelFontColor: "#fff" },
                    { label: "Tax", y: parseFloat(tax), indexLabelFontColor: "#fff" },
                    { label: "Living", y: parseFloat(living), indexLabelFontColor: "#fff" },
                    { label: "Transport", y: parseFloat(transport), indexLabelFontColor: "#fff" },
                    { label: "Hobbies", y: parseFloat(hobbies), indexLabelFontColor: "#fff" },
                    { label: "Left Over", y: parseFloat(leftover), indexLabelFontColor: "#fff" }
            ]
        }
            ]
        });

        chart.render();
    }
}
drawDebt = function (chartType, mEarn, tax, living, transport, hobbies, total, leftover) {

    if (mEarn == "0" && tax == "0" && living === "0" && transport === "0" && hobbies === "0" && act === "0" && spending === "0" && misc === "0") {
        document.getElementById("lblChartType").style.display = "none";
        document.getElementById("DropDownList1").style.display = "none";
        document.getElementById("chartPlaceholder").style.display = "none";
        document.getElementById("noDataPlaceholder").textContent = "Not enough data to draw chart";
    } else {
        var chart = new CanvasJS.Chart("chartContainer", {
            backgroundColor: "rgba(160, 32, 240, 0)",
            title: {
                fontColor: "#fff",
                text: "Total Monthly: £" + mEarn,
            },
            animationEnabled: true, //disable here

            data: [
        {
            // Change type to "doughnut", "line", "splineArea", etc.
            type: chartType,
            dataPoints: [
                    { label: "Total Expense", y: parseFloat(total), indexLabelFontColor: "#fff" },
                    { label: "Tax", y: parseFloat(tax), indexLabelFontColor: "#fff" },
                    { label: "Living", y: parseFloat(living), indexLabelFontColor: "#fff" },
                    { label: "Transport", y: parseFloat(transport), indexLabelFontColor: "#fff" },
                    { label: "Hobbies", y: parseFloat(hobbies), indexLabelFontColor: "#fff" },
                    { label: "Debt", y: parseFloat(leftover), indexLabelFontColor: "#fff" }
            ]
        }
            ]
        });

        chart.render();
    }
}
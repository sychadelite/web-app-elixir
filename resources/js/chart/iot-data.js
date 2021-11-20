export const iotChartData = {
    type: "bar",
    data: {
        labels: ["January", "February", "March", "April", "Mei", "June", "July", "August", "September", "October", "November", "Desember"],
        datasets: [
            {
                label: "Flow Rate",
                type: "line",
                data: [1.4, 2.4, 6.0, 5.4, 7.9, 8.2, 3.3, 3.8, 5.2, 6.1, 8.0, 5.5],
                backgroundColor: "rgba(54,73,93,.5)",
                borderColor: "#36495d",                                                             // blue line
                borderWidth: 3
            },
            {
                label: "Total Millilitres",
                type: "line",
                data: [58, 60, 50, 67, 48, 79, 63, 43, 51, 46, 72, 68],
                backgroundColor: "rgb(47, 6, 88)",
                borderColor: "rgb(97, 228, 126)", 
                borderWidth: 3                                                                      // green line
            },
            {
                label: "Total Litres",
                type: "bar",
                data: [166, 281, 300, 323, 492, 285, 662, 514, 480, 218, 313, 100],
                backgroundColor: "rgba(71, 183,132,.5)",
                borderColor: "#47b784",
                borderWidth: 3                                                                    
            }
        ]
    },
    options: {
        responsive: true,
        lineTension: 1,
        scales: {
            yAxes: [
            {
                ticks: {
                beginAtZero: true,
                padding: 25
                }
            }
            ]
        }
    }
}

export default iotChartData;
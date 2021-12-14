export const cityChartData = {
    type: "line",
    data: {
        labels: ["Babol",	"Cabanatuan",	"Daegu",	"Jerusalem",	"Fairfield",	"New York",	"Gangtok", "Buenos Aires", "Hafar Al-Batin", "Idlib"],
        datasets: [
            {
                label: 'Moslem People',
                data: [600,	1150,	342,	6050,	2522,	3241,	1259,	157,	1545, 9841],
                fill: true,
                borderColor: '#47b784',
                backgroundColor: 'rgba(71, 183,132,.5)',
                borderWidth: 3
            }
        ]
    },
    options: {
        responsive: true,
        maintainAspectRatio: true,                          // its about the size of chart
        lineTension: 1,
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                },
                gridLines: {
                    display: true
                }
            }],
            xAxes: [{
                gridLines: {
                    display: false
                }
            }]
        },
        legend: {
            display: true
        },
    }
}

export default cityChartData;
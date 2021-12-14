<template>
  <div>
    <div class="chart">
          <!-- <h3 class="title-chart">Our Solar Systems Compositions</h3>
          <canvas id="planet-chart"></canvas>
          <h3 class="title-chart">Moslem People</h3>
          <canvas id="city-chart"></canvas> -->
          <h3 class="title-chart">Water Consumptions</h3>
          <canvas id="iot-chart"></canvas>
    </div>
  </div>
</template>

<script>
import Chart from 'chart.js'
import planetChartData from './planet-data.js'
import cityChartData from './city-data.js'
import iotChartData from './iot-data.js'

export default {
  name: 'PlanetChart',
  data() {
    return {
      // planetChartData: planetChartData,
      // cityChartData: cityChartData,
      iotChartData: iotChartData
    }
  },
  mounted() {
    // const ctx = document.getElementById('planet-chart');
    // new Chart(ctx, this.planetChartData);

    // const ctxs = document.getElementById('city-chart');
    // new Chart(ctxs, this.cityChartData);

    const ctxsz = document.getElementById('iot-chart');
    new Chart(ctxsz, this.iotChartData);
  }
}
</script>

<style>
.chart {
    cursor: pointer;
    margin-top: 6rem;
    margin-bottom: 3rem;
}
.title-chart {
    margin-top: 2.5rem;
    margin-bottom: 1.5rem;
    color: rgb(182, 182, 182);
}
</style>
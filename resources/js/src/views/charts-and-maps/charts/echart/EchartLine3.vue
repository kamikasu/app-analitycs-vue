<template>
  <b-card title="Create Tickets">
    <div class="d-flex justify-content-between flex-wrap">
      <!-- <div class="mb-1 mb-sm-0">
        <span class="text-muted">Create Tickets</span>
      </div> -->
      <!-- <div class="d-flex align-content-center mb-1 mb-sm-0">
        <h1 class="font-weight-bolder ">
          183,382
        </h1>
        <div class="pt-25 ml-75">
          <b-badge variant="light-secondary">
            <feather-icon
              icon="ArrowDownIcon"
              size="12"
              class="text-danger align-middle"
            />
            <span class="font-weight-bolder align-middle"> 6%</span>
          </b-badge>
        </div>
      </div> -->
    </div>

    <!-- echart -->
    <app-echart-line :option-data="option" />

  </b-card>
</template>

<script>
import { BCard, BBadge } from 'bootstrap-vue'
import AppEchartLine from '@core/components/charts/echart/AppEchartLine3.vue'

let base = +new Date(1988, 9, 3);
let oneDay = 24 * 3600 * 1000;
let data = [[base, Math.random() * 300]];
for (let i = 1; i < 20000; i++) {
  let now = new Date((base += oneDay));
  data.push([+now, Math.round((Math.random() - 0.5) * 20 + data[i - 1][1])]);
}

export default {
  components: {
    BCard,
    AppEchartLine,
    BBadge,
  },
  data() {
    return {
      option: {
        title: "CODER/DEMO",
        xAxisData: ['7/12', '8/12', '9/12', '10/12', '11/12', '12/12', '13/12', '14/12', '15/12', '16/12', '17/12', '18/12', '19/12', '20/12'],
        // xAxisData: ,
        legend: ['Coder'],
        series: [
          {
            name: 'Cant Tickets',
            type: 'line',
            smooth: true,
            symbol: 'none',
            areaStyle: {},
            data: data 
          }
        ]
      },
    }
  },
}
</script>

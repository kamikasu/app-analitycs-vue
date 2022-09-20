<template>
  <b-card title="LAST 4 WEEKS CODER/DEMO PRODUCTION">
    <div class="d-flex justify-content-between flex-wrap">
      <div class="mb-1 mb-sm-0">
        <span class="text-muted">Cant Tickets</span>
      </div>
      <div class="d-flex align-content-center mb-1 mb-sm-0">
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
      </div>
    </div>

    <!-- echart -->
    <app-echart-line :option-data="option" />

  </b-card>
</template>

<script>
import { BCard, BBadge } from 'bootstrap-vue'
import AppEchartLine from '@core/components/charts/echart/AppEchartLine2.vue'

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
        legend: ['Coder', 'Manual Demo', 'MDCloud AI demo'],
        series: [
          {
            name: 'Coder',
            type: 'line',
            stack: 'Total',
            data: [3809, 2478, 2795, 700, 345, 3678, 4189,3809, 2478, 2795, 700, 345,345, 3678]
          },
          {
            name: 'Manual Demo',
            type: 'line',
            stack: 'Total',
            data: [2230, 1842, 1591, 2354, 2955, 3306, 1770,2230, 1842, 1591, 2354, 2955, 3306, 1770]
          },
          {
            name: 'MDCloud AI demo',
            type: 'line',
            stack: 'Total',
            data: [3150, 2332, 2701, 1774, 1907, 3307, 2710,3150, 2332, 2701, 1774, 1907, 3307, 2710]
          }
        ]
      },
    }
  },
}
</script>

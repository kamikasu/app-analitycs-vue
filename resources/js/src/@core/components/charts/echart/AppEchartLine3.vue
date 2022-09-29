<template>
  <e-charts
    ref="line"
    autoresize
    :options="line"
    theme="theme-color"
    auto-resize
  />
</template>

<script>
import ECharts from 'vue-echarts'
import 'echarts/lib/component/tooltip'
import 'echarts/lib/component/legend'
import 'echarts/lib/chart/line'
import theme from './theme.json'
import SocketioService from '../../../../services/socketio.service.js';

ECharts.registerTheme('theme-color', theme)

export default {
  components: {
    ECharts,
  },
  props: {
    optionData: {
      type: Object,
      default: null,
    },
  },
  data() {
    SocketioService.subcribers('accept_ticket',  (data) => {
      console.log(typeof data,data,'test');
      this.x_toggle(data);
    });
    return {
      line: {
        // Make gradient line here
        visualMap: [{
          show: true,
          type: 'continuous',
          min: 0,
          max: 6000,
        }],
        grid: {
          left: '3%',
          right: '4%',
          bottom: '1%',
          containLabel: true
        },
        toolbox: {
          feature: {
            saveAsImage: {}
          }
        },
        title: {
         text: this.optionData.title
        },
        legend: {
          data: this.optionData.legend,
        },
        tooltip: {
          trigger: 'axis',
        },
        xAxis: [{
          type: 'time',
          boundaryGap: false
        }],
        yAxis: {
          type: 'value',
          boundaryGap: [0, '100%']
        },
        dataZoom: [
          {
            type: 'inside',
            start: 0,
            end: 20
          },
          {
            start: 0,
            end: 20
          }
        ],
        series: this.optionData.series,
      },
    }
  },
  methods:
  {
      x_toggle: function(data_mongo)
      {
        // console.log('methos',data_mongo);
        let now = new Date(data_mongo.date);
        let data_x = [];
        data_x = [now.getTime(),347]
        // console.log(data_x);
        let index=-1
        let data_new
        let data_chart = this.line.series[0].data;
        for(let i = 0; i < data_chart.length; i++){
          const curr = data_chart[i];
          if(curr.includes(now.getTime())){
            index = i;
            break;
          }
        }
        if(index == -1){
          data_chart = Array.from(new Set([...this.line.series[0].data, data_x]));
          if (data_chart.length>15){
            data_chart.shift()
          }
          console.log('new add',data_chart)
        } else {
          let get_value = this.line.series[0].data[index][1]
          data_chart[index] = [now.getTime(),get_value + 20]
          console.log('updat add',data_chart)
        }
        
        this.line = {
          ...this.line,
          series:  [
          {
            name: 'Cant Tickets',
            type: 'line',
            smooth: true,
            symbol: 'none',
            areaStyle: {},
            data: data_chart 
          }
        ]
        };
      }
  },

}
</script>

<style>
.echarts {
  width: 100% !important;
}
</style>

<template>
  <div>
    <b-calendar block
    v-model="value" 
    :min="min" 
    :max="max" 
    locale="en" 
    selected-variant="success" 
    today-variant="info" 
    nav-button-variant="primary" 
    :date-format-options="{ year: 'numeric', month: 'short', day: '2-digit', weekday: 'short' }"
    ></b-calendar>
  </div>
</template>

<script>
  export default {
    name: 'Calendar',
    data() {
        const now = new Date()
        const today = new Date(now.getFullYear(), now.getMonth(), now.getDate())
        // 15th two months prior
        const minDate = new Date(today)
        minDate.setMonth(minDate.getMonth() - 12)
        minDate.setDate(15)
        // 15th in two months
        const maxDate = new Date(today)
        maxDate.setMonth(maxDate.getMonth() + 12)
        maxDate.setDate(15)

        return {
            value: today,
            min: minDate,
            max: maxDate
        }
    }
  }
</script>

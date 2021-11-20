<template>
  <div>
    <aside>
    <sidebar-menu :menu="menu" @toggle-collapse="onToggleCollapse" @item-click="onItemClick"/>

    </aside>
  </div>
</template>

<script>
import { SidebarMenu } from 'vue-sidebar-menu'

export default {
  components: {
    SidebarMenu
  },
  data() {
    return {
      menu: [
        {
          header: true,
          title: 'Main Navigation',
          hiddenOnCollapse: true
        },
        {
          href: '/',
          title: 'Dashboard',
          icon: 'fa fa-user'
        },
        {
          href: '/charts',
          title: 'Charts',
          icon: 'fa fa-chart-area',
          child: [
          {
            href: '/charts/sublink',
            title: 'Sub Link'
          }
          ]
        }
      ]
    }
  },
  methods: {
    onToggleCollapse(collapsed) {},
    onItemClick(event, item, node) {}
  }
}
</script>

<style>

</style>
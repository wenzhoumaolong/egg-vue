<template>
  <div class="app-wrapper" :class="{'hide-sidebar': !sidebar.opened}">
    <div class="sidebar-wrapper">
      <Sidebar class="sidebar-container"/>
    </div>
    <div class="main-container">
      <Navbar/>
      <AppMain/>
    </div>
  </div>
</template>

<script>
  import Navbar from 'views/layout/NavBar';
  import Sidebar from 'views/layout/Sidebar';
  import AppMain from 'views/layout/AppMain';

  export default {
    name: 'layout',
    components: {
      Navbar,
      Sidebar,
      AppMain
    },
    computed: {
      sidebar() {
        return this.$store.state.app.sidebar;
      }
    }
  }
</script>
<style lang="scss" scoped>
  @import "src/styles/mixin.scss";

  .app-wrapper {
    @include clearfix;
    position: relative;
    height: 100%;
    width: 100%;
    &.hide-sidebar {
      .sidebar-wrapper {
        transform: translate(-140px, 0);
        .sidebar-container {
          transform: translate(132px, 0);
        }
        &:hover {
          transform: translate(0, 0);
          .sidebar-container {
            transform: translate(0, 0);
          }
        }
      }
      .main-container {
        margin-left: 40px;
      }
    }
    .sidebar-wrapper {
      width: 180px;
      position: fixed;
      top: 0;
      bottom: 0;
      left: 0;
      z-index: 1001;
      overflow-x: hidden;
      transition: all .28s ease-out;
      @include scrollBar;
    }
    .sidebar-container {
      transition: all .28s ease-out;
    }
    .main-container {
      min-height: 100%;
      transition: all .28s ease-out;
      margin-left: 180px;
    }
  }
</style>

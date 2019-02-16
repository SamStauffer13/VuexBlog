<template>
  <div id="app">
    <Navigation/>
    <div v-show="loaded === false">
      <Loader/>
    </div>    
    <div v-if="loaded === true">
      <Welcome/>
      <About/>
      <Timeline/>
    </div>
  </div>
</template>

<script>
import Navigation from "./components/Navigation.vue";
import Welcome from "./components/Welcome.vue";
import About from "./components/About.vue";
import Loader from "./components/Loader.vue";
import Timeline from "./components/Timeline.vue";

export default {
  name: "app",
  components: {
    Navigation,
    Loader,
    Welcome,
    About,
    Timeline
  },
  data() {
    return {
      loaded: false
    };
  },
  mounted() {
    setTimeout(() => {
      this.loaded = true;
    }, 6000);
    // axios
    //   .get("https://samstauffer-3fcaa.firebaseio.com/projects.json")
    //   .then(response => {this.projects = response.data;})
    //   .catch(error => {});
  }
};
</script>

<style lang="scss">
#id{
  font-family: "Lato", sans-serif
}
</style>

<template>
  <div class="timeline" id="posts">
    <div
      v-for="(project, index) in projects"
      :key="project.title"
      :class="index % 2 == 0 ? 'container left' : 'container right'"
    >
      <div class="content" :id="project.date">
        <h4 :id="project.category">
          <a style="text-decoration:none;" href="javascript:void(0)">{{project.category}}</a> |
          <b>{{project.date}}</b>
        </h4>
        <img class="preview" v-if="project.image !== null" :src="project.image">
        <h1 v-if="project.url !== null && project.url.length > 0">
          <a :href="project.url">{{project.title}}</a>
        </h1>
        <h1 v-else>{{project.title}}</h1>
        <p>{{project.description}}</p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      projects: []
    };
  },
  mounted() {
    const json = [
      {
        category: "Front End Development",
        date: "01/07/2018",
        image: null,
        title: "How to host a serveless webapp for free in 3 minutes",
        description: "",
        url: "javascript:void(0)",
        active: true
      },
      {
        category: "Front End Development",
        date: "01/06/2018",
        image: null,
        title: "¿Vue > Angular > React?",
        description: "",
        url: "",
        active: true
      },
      {
        category: "Ultralight Hiking",
        date: "01/05/2018",
        image: null,
        title: "Life leasons from hiking",
        description: "Always leave it better than you found it",
        url: "",
        active: true
      },
      {
        category: "Ultralight Hiking",
        date: "01/05/2018",
        image: null,
        title: "What's in my backpack?",
        description:
          "My loadout weighs 13 pounds with 3 days of food, can keep 3 people dry, and sleeps comfortably down to -3 degrees.",
        url: "",
        active: true
      },
      {
        category: "Front End Development",
        date: "01/05/2018",
        image: null,
        title: "Take a second to appreciate this website's design",
        description:
          "There's just something about well designed websites that gets to me.",
        url: "https://garden-eight.com/",
        active: true
      },
      {
        category: "Philosophía",
        date: "01/05/2018",
        image: null,
        title: "O'de to minimalism",
        description: "How owning less than 100 things made me a better person.",
        url: "",
        active: true
      },
      {
        category: "The Scratch",
        date: "01/05/2018",
        image: null,
        title: "I made a barbeque hot tub",
        description:
          "An arduino controls a blower that regulates the temperature of the smoker and changes the color of the LEDz to reflect the water temperature",
        url: "",
        active: true
      },
      {
        category: "Ultralight Hiking",
        date: "01/05/2018",
        image: null,
        title: "Hiking Washington's Upper Enchantements",
        description: "A mountain goat stalked me up Assgard Pass.",
        url: "",
        active: true
      },
      {
        category: "Ultralight Hiking",
        date: "01/05/2018",
        image: null,
        title: "Hiking Zion's Narrows",
        description:
          "Thunderstorms north of Zion can cause a 7 foot wall of water to flash through the Narrows; this makes hikers kinda skitish",
        url: "https://www.magisto.com/video/bVsGPQMAGSE_UBNhCzE?l=vsm&o=w&c=c",
        active: true
      },
      {
        category: "Ultralight Hiking",
        date: "01/05/2018",
        image: null,
        title: "Hiking a section of the Oregon Coast Trail",
        description:
          "I found a message in a bottle and slept over a bed of purple iris while watching a lighthouse trace the black ocean.",
        url: "",
        active: true
      },
      {
        category: "Ultralight Hiking",
        date: "01/05/2018",
        image: null,
        title: "1st roadtrip through Ireland",
        description: "",
        url: "",
        active: true
      },
      {
        category: "Ultralight Hiking",
        date: "",
        image: null,
        title: "1st roadtrip through Iceland",
        description: "",
        url: "https://www.magisto.com/video/MUcVIwUUACo6BgFgCzE?l=vsm&o=w&c=c",
        active: true
      },
      {
        category: "The Scratch",
        date: "01/05/2018",
        image: null,
        title: "I made a Boring Company Flamethrower for $200",
        description:
          "I use it to kill weeds, melt snow, light my fireplace, and deter intruders",
        url: "",
        active: true
      },
      {
        category: "Scandanavian Fire Cooking",
        date: "01/05/2018",
        image: null,
        title: "My favorite fireplace recipes",
        description: "",
        url: "",
        active: true
      },
      {
        category: "The Scratch",
        date: "01/05/2018",
        image: null,
        title: "I made a Rainmeter Skin (and so can you!)",
        description:
          "I was upset by the lack of tutorials on how to program rainmeter skins, so I made my own",
        url: "",
        active: true
      },
      {
        category: "The Scratch",
        date: "01/05/2018",
        image: null,
        title: "I made a water cooled gaming PC",
        description: "",
        url: "",
        active: true
      },
      {
        category: "The Scratch",
        date: "01/05/2018",
        image: "../assets/iceland2.jpg",
        title: "I took this photo when I realized we need to break up",
        description:
          "It was 1am Christmas day, the weather was so warm that I was wearing short sleeves and there was a thick fog. I had installed a counter app on my phone the  week before. I'd click it every time I had this feeling. The counter read 41 by the time I took the photo.",
        url: "",
        active: false
      },
      {
        category: "The Scratch",
        date: "01/05/2018",
        image: null,
        title: "I made a タチコマ desk",
        description: "",
        url: "",
        active: true
      },
      {
        category: "Send Noods",
        date: "01/07/2018",
        image: null,
        title: "Best ramen in Vegas",
        description:
          "You can find round trip flights to sin city for ~$100 and there is tons of hiking to be had in that area. Every time I pass through I grab a bowl at Monta Noodle House. This place is tiny so remember to respect it's japanese customs: Stand patiently in the line that runs out the door, place your order immediately when seated, quickly slurp up them noods as soon as you get them, then GTFO so other travelers can get in on this hidden gem.",
        url: "https://www.monrestaurantgroup.com/project-02",
        active: true
      },
      {
        category: "Philosophía",
        date: "01/05/2018",
        image: null,
        title: "Can you have Winter Weather AND Global Warming?",
        description:
          "Climate scientists don't care if you're a democrate or republican. They just want you to understand how the earth's climate works. Here are 5 scientific facts I wish our president could understand about climate change.",
        url: "",
        active: true
      },
      {
        category: "Philosophía",
        date: "01/05/2018",
        image:
          "https://trello-attachments.s3.amazonaws.com/5317777c6329417441ea9b4e/5b73814056ea668e8199e8f3/ddd157eec9b5541cb14a5bb5b09a426d/image.png",
        title: "We often don't appreciate the scale of things",
        description: `The size of an atomic nucleas compared to the electrons surrounding it, Planck length, the size of our star compared to our planet, the hopeless distance between stars`,
        url: "",
        active: true
      },
      {
        category: "Philosophía",
        date: "01/05/2018",
        image: null,
        title: "Existential Riddles",
        description: "Currently my favorite article on the internet",
        url:
          "https://www.newyorker.com/magazine/2015/12/14/existential-riddles",
        active: true
      }
    ];

    json.sort((a, b) => {
      return new Date(b.date) - new Date(a.date);
    });

    this.projects = json.filter(post => {
      return post.active === true;
    });
    
    // axios
    //   .get("https://samstauffer-3fcaa.firebaseio.com/projects.json")
    //   .then(response => {this.projects = response.data;})
    //   .catch(error => {});
  }
};
</script>

<style scoped lang="scss">
// * {
//   box-sizing: border-box;
// }

.preview {
  max-width: 400px;
}

/* The actual timeline (the vertical ruler) */
.timeline {
  font-family: Helvetica, sans-serif;
  position: relative;
  max-width: 1200px;
  margin: 0 auto;
}

/* The actual timeline (the vertical ruler) */
.timeline::after {
  content: "";
  position: absolute;
  width: 6px;
  background-color: #000000;
  top: 0;
  bottom: 0;
  left: 50%;
  margin-left: -3px;
}

/* Container around content */
.container {
  padding: 10px 40px;
  position: relative;
  background-color: inherit;
  width: 50%;
}

/* The circles on the timeline */
.container::after {
  content: "";
  position: absolute;
  width: 25px;
  height: 25px;
  right: -17px;
  background-color: #000000;
  border: 4px solid #ffffff;
  top: 15px;
  border-radius: 50%;
  z-index: 1;
}

/* Place the container to the left */
.left {
  left: 0;
}

/* Place the container to the right */
.right {
  left: 50%;
}

/* Add arrows to the left container (pointing right) */
.left::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  right: 30px;
  border: medium solid black;
  border-width: 10px 0 10px 10px;
  border-color: transparent transparent transparent black;
}

/* Add arrows to the right container (pointing left) */
.right::before {
  content: " ";
  height: 0;
  position: absolute;
  top: 22px;
  width: 0;
  z-index: 1;
  left: 30px;
  border: medium solid black;
  border-width: 10px 10px 10px 0;
  border-color: transparent black transparent transparent;
}

/* Fix the circle for containers on the right side */
.right::after {
  left: -16px;
}

/* The actual content */
.content {
  padding: 20px 30px;
  background-color: white;
  position: relative;
  border-radius: 6px;
}

/* Media queries - Responsive timeline on screens less than 600px wide */
@media screen and (max-width: 600px) {
  /* Place the timelime to the left */
  .timeline::after {
    left: 31px;
  }

  /* Full-width containers */
  .container {
    width: 100%;
    padding-left: 70px;
    padding-right: 25px;
  }

  /* Make sure that all arrows are pointing leftwards */
  .container::before {
    left: 60px;
    border: medium solid white;
    border-width: 10px 10px 10px 0;
    border-color: transparent white transparent transparent;
  }

  /* Make sure all circles are at the same spot */
  .left::after,
  .right::after {
    left: 15px;
  }

  /* Make all right containers behave like the left ones */
  .right {
    left: 0%;
  }
}
</style>
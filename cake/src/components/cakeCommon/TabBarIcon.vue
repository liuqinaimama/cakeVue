<template>
    <div>
        <img :src="focused?selectedImage:normalImage" class="imgStyle"/>
    </div>
</template>
<script>
    export default {
        props:{
            focused:false,//默认不选中
            selectedImage:{default:""},
            normalImage:{default:""},
        },
        data(){
            return{

            }
        },

    }
</script>
<style scoped>
    .imgStyle{
        width:30px;height:30px;
    }
</style>
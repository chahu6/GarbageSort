<template>  
  <div class="feedback-form recruitment-container ">  
    <h2>用户意见反馈</h2>  
    <form @submit.prevent="submitFeedback">  
      <div class="form-group">  
        <label for="name">姓名：</label>  
        <input type="text" id="name" v-model="name" required>  
      </div>  
      <div class="form-group">  
        <label for="email">邮箱：</label>  
        <input type="email" id="email" v-model="email" required>  
      </div>  
      <div class="form-group">  
        <label for="feedback">反馈内容：</label>  
        <textarea id="feedback" v-model="feedback" required></textarea>  
      </div>  
      <button type="submit">提交</button>  
    </form>  
    <p v-if="submitted">感谢您的反馈，我们已收到您的信息！</p>  
  </div>  
</template>  
  
<script>  
export default {  
  data() {  
    return {  
      name: '',  
      email: '',  
      feedback: '',  
      submitted: false  
    };  
  },  
  methods: {  
    submitFeedback() {  
      // 这里可以添加提交反馈到服务器的逻辑  
      // 例如使用axios发送POST请求到服务器  
      console.log('提交反馈:', this.name, this.email, this.feedback);  
  
      // 假设反馈提交成功，则设置提交标志为true  
      this.submitted = true;  
      // 清除表单数据  
      this.resetForm();  
    },  
    resetForm() {  
      this.name = '';  
      this.email = '';  
      this.feedback = '';  
      this.submitted = false;  
    }  
  }  
};  
</script>  
  
<style scoped>  
.feedback-form {  
  font-size: 16px; /* 设置字体大小为适中 */  
  padding: 20px;  
}  
  
.form-group {  
  margin-bottom: 15px;  
}  
  
label {  
  display: block;  
  margin-bottom: 5px;  
   font-size: 20px; 
    font-family: '等线', serif; 
}  
  
input[type="text"],  
input[type="email"],  
textarea {  
  width: 100%;  
  padding: 5px;  
  border: 1px solid #ccc;  
  border-radius: 4px;  
   font-family: 'Times New Roman', serif; 
}  
  
button {  
  padding: 8px 15px;  
  background-color: #4CAF50;  
  color: white;  
  border: none;  
  border-radius: 4px;  
  cursor: pointer;  
   font-family: 'Times New Roman', serif; 
}  
  
button:hover {  
  background-color: #45a049;  
}  
  
p {  
  color: green;  
  margin-top: 10px;  
   font-family: 'Times New Roman', serif; 
}  
 h2{
	   text-align: center;
	     font-size: 29px; 
		  padding-bottom: 1em;
		   font-family: 'Times New Roman', serif; 
 }
</style>

</style>
</script>  
  
<style scoped>  
.recruitment-container {  
	height: 400px; /* 设置你想要的固定高度 */  
	  overflow: auto; /* 如果内容超出容器，则显示滚动条 */  
	  /* 其他样式保持不变 */
	    min-height: 650px; /* 设置最小高度 */  
  /* 其他样式保持不变 */  
  position: relative; /* 确保伪元素能够相对于此容器定位 */  
  overflow: hidden; /* 如果需要，隐藏超出容器的背景图片 */  
}  
  
.recruitment-container::before {  
  content: ""; /* 伪元素需要内容，即使它是空的 */  
  position: absolute; /* 伪元素脱离文档流，相对于最近的定位祖先元素（在这里是.recruitment-container）定位 */  
  top: 0;  
  right: 0;  
  bottom: 0;  
  left: 0;  
  background-image: url(''); /* 背景图片路径 */ 
  background-repeat: no-repeat; /* 根据需要设置是否重复背景图片 */  
  background-size: cover; /* 背景图片覆盖整个容器 */  
  background-position: center; /* 背景图片居中显示 */  
  opacity: 0.8; /* 设置背景图片的透明度，这里设置为半透明 */  
  z-index: -1; /* 确保背景图片在内容之下 */  

  /* 添加你的样式 */  
  padding: 20px;  
  max-width: 400px;  
  margin: 0 auto;  
}  
</style>
<!-- 
/* 设置输入框和标签的字体大小和颜色 */  
input[type="text"],  
input[type="email"],  
textarea,  
label {  
  font-size: 20px; /* 字体大小 */  
  color: 红色; /* 字体颜色 */  
}
.feedback-container {  
  max-width: 600px;  
  margin: 0 auto;  
  padding: 20px;  
  border: 1px solid #ddd;  
  border-radius: 5px;  
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);  
}  
  
.form-group {  
  margin-bottom: 15px;  
}  
  
label {  
  display: block;  
  margin-bottom: 5px;  
}  
  
input[type="text"],  
input[type="email"],  
textarea {  
  width: 100%;  
  padding: 10px;  
  border: 1px solid #ccc;  
  border-radius: 4px;  
  box-sizing: border-box;  
} -->
<template>
  <div class="container">
    <div>
      <h1 class="title">Docker desktop!</h1>
      <h2 class="subtitle">
        <a href="https://docs.docker.com/docker-for-windows/edge-release-notes/#docker-desktop-community-2170" target="_blank">Download</a>
      </h2>
      <code>%appdata%/docker</code>
      <h3>Open settings.json</h3>
      <nuxt-link class="back" to="/">Terug</nuxt-link>
    </div>
  </div>
</template>

<style lang='scss' scoped>
.title {
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

code {
  display: block;
}

.links {
  padding-top: 15px;
}

.back {
  position: absolute;
  left: 40px;
  bottom: 40px;
}
</style>

// filter-posts.js
const { Sequelize, DataTypes } = require('sequelize')
const sequelize = new Sequelize('test_db', 'root', 'Sangram@21', {
  host: 'localhost',
  dialect: 'mysql'
})

const Post = sequelize.define('Post', {
  title: {
    type: DataTypes.STRING,
    allowNull: false
  },
  content: {
    type: DataTypes.TEXT,
    allowNull: false
  }
})

async function filterPosts() {
  await sequelize.sync()

  const posts = await Post.findAll({
    where: {
      title: 'First Post'
    }
  })
  console.log('Filtered posts:', JSON.stringify(posts, null, 2))

  await sequelize.close()
}

filterPosts()
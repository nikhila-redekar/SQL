// paginate-posts.js
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

async function paginatePosts() {
  await sequelize.sync()

  const posts = await Post.findAll({
    limit: 2,
    offset: 1
  })
  console.log('Paginated posts:', JSON.stringify(posts, null, 2))

  await sequelize.close()
}

paginatePosts()
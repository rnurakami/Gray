

import org.junit.*
import grails.test.mixin.*

@TestFor(ArticleController)
@Mock(Article)
class ArticleControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/article/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.articleInstanceList.size() == 0
        assert model.articleInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.articleInstance != null
    }

    void testSave() {
        controller.save()

        assert model.articleInstance != null
        assert view == '/article/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/article/show/1'
        assert controller.flash.message != null
        assert Article.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/article/list'


        populateValidParams(params)
        def article = new Article(params)

        assert article.save() != null

        params.id = article.id

        def model = controller.show()

        assert model.articleInstance == article
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/article/list'


        populateValidParams(params)
        def article = new Article(params)

        assert article.save() != null

        params.id = article.id

        def model = controller.edit()

        assert model.articleInstance == article
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/article/list'

        response.reset()


        populateValidParams(params)
        def article = new Article(params)

        assert article.save() != null

        // test invalid parameters in update
        params.id = article.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/article/edit"
        assert model.articleInstance != null

        article.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/article/show/$article.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        article.clearErrors()

        populateValidParams(params)
        params.id = article.id
        params.version = -1
        controller.update()

        assert view == "/article/edit"
        assert model.articleInstance != null
        assert model.articleInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/article/list'

        response.reset()

        populateValidParams(params)
        def article = new Article(params)

        assert article.save() != null
        assert Article.count() == 1

        params.id = article.id

        controller.delete()

        assert Article.count() == 0
        assert Article.get(article.id) == null
        assert response.redirectedUrl == '/article/list'
    }
}

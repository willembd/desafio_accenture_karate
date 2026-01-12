Feature: Atualizar ISBN do Livro

    Background:

        * call read('classpath:features/books/addBooks/add_books.feature@sucesso')
        * call read('classpath:features/books/searchBook/search_books.feature@sucesso')

    @sucesso
    Scenario: Atualização de ISBN com sucesso

        * def isbnNovo = books[1].isbn

        * header Authorization = 'Bearer ' + token
        * def body =
        """
        {
          "userId": "#(user_id)",
          "isbn": "#(isbnNovo)"
        }
        """

        Given url baseUrl
        And path 'BookStore/v1/Books/', book
        And request body
        When method put
        Then status 200
        And match response == read('classpath:features/books/update/update_books_schema.json')

    Scenario: Erro ao atualizar de ISBN sem autenticacao

        * def isbnNovo = books[1].isbn


        * def body =
        """
        {
          "userId": "#(user_id)",
          "isbn": "#(isbnNovo)"
        }
        """

        Given url baseUrl
        And path 'BookStore/v1/Books/', book
        And request body
        When method put
        Then status 401
        And match response == read('classpath:features/books/update/update_books_schema_error.json')



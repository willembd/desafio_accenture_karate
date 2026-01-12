Feature: Adicionar Livro ao Usuario

    Background:
        * call read('classpath:features/users/authentication/authentication.feature@sucesso')
        * call read('classpath:features/books/listCatalog/books_list_catalog.feature')

    @sucesso
    Scenario: Adicionando Livro com sucesso
        Given url baseUrl
        And path 'BookStore/v1/Books'
        * def book = response.books[0].isbn
        * header Authorization = 'Bearer ' + token

        * def body =
        """
        {
          "userId": "#(user_id)",
            "collectionOfIsbns": [
                {
                  "isbn": "#(book)"
                  }
                ]
        }
        """
        And request body
        When method post
        Then status 201
        And match response == read('classpath:features/books/addBooks/add_books_schema.json')

    Scenario: Erro ao adicionar livro ISBN incorreto
        Given url baseUrl
        And path 'BookStore/v1/Books'
        * def book = response.books[0].isbn
        * header Authorization = 'Bearer ' + token

        * def body =
        """
        {
          "userId": "#(user_id)",
            "collectionOfIsbns": [
                {
                  "isbn": "0000000"
                  }
                ]
        }
        """
        And request body
        When method post
        Then status 400
        And match response == read('classpath:features/books/addBooks/add_books_schema_error.json')



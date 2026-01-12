Feature: Listar catalogo de livros

    Background:

    Scenario: listar catalogo com sucesso
        Given url baseUrl
        And path "/BookStore/v1/Books"
        When method get
        Then status 200
        And match response == read('classpath:features/books/listCatalog/books_list_catalog_schema.json')

        * def books = response.books
        * print response



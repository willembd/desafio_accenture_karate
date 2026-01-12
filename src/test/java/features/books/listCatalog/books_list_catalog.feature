Feature: Listar catalogo de livros

    Background:

    Scenario: listar catalogo com sucesso
        Given url baseUrl
        And path "/BookStore/v1/Books"
        When method get
        Then status 200

        * def books = response.books
        * print response



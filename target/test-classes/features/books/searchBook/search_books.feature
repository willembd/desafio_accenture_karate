Feature: Buscar livro por ISBN

    Background:
        * call read('classpath:features/books/listCatalog/books_list_catalog.feature')

    @sucesso
    Scenario: Buscar Livro com sucesso

        Given url baseUrl
        And path 'BookStore/v1/Book'
        And param ISBN = books[0].isbn
        When method get
        Then status 200
        And match response.isbn == books[0].isbn

        * print responseStatus
        * print response


    Scenario: Erro ao buscar livro

        Given url baseUrl
        And path 'BookStore/v1/Book'
        And param ISBN = '00000'
        When method get
        Then status 400
        And match response.message == "ISBN supplied is not available in Books Collection!"



Feature: Deleteando Usuário

    Background:

       * call read('classpath:features/users/authentication/authentication.feature@sucesso')

    @smoke
    Scenario: Deleteando Usuário com Sucesso
        Given url baseUrl
        And path '/Account/v1/User/', user_id
        And header Authorization = 'Bearer ' + token
        When method delete
        Then status 204

    Scenario: Erro ao deletar usuario sem token
        Given url baseUrl
        And path '/Account/v1/User/', user_id
        When method delete
        Then status 401
        And match response == read('classpath:features/users/delete/users_delete_schema_error.json')
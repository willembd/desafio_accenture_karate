Feature: Gerar Token para autentificação

    Background:
           * call read('classpath:features/users/create/users_create.feature@sucesso')

    @token
    @sucesso
    Scenario: Gerar Token
        Given url baseUrl
        And path '/Account/v1/GenerateToken'
        And request
        """
        {
            "userName": "#(user_name)",
            "password": "#(user_password)"
        }
        """
        When method post
        Then status 200
        And match response.token != null
        

        * def token = response.token
        * print token


    Scenario: Erro ao Gerar Token
        Given url baseUrl
        And path '/Account/v1/GenerateToken'
        And request
        """
        {
            "userName": "#(user_name)",
            "password": "SenhaErrada"
        }
        """
        When method post
        Then status 200
        And match response.token == null


        * def token = response.token
        * print token


Feature: Criação de Usuário

        Background:
            * def user_name = 'NomeID' + java.util.UUID.randomUUID()
            * def usuario = 
            """
              {
                "userName": "#(user_name)",
                "password": "P@ssword2"
              }
            """

        @sucesso
        Scenario: Criando Usuário com Sucesso
            
            Given url baseUrl + '/Account/v1/User'
            And request usuario
            When method post
            Then status 201

            * def user_id = response.userID
            * def user_password = usuario.password
            * print user_name



        Scenario: Erro ao criar Usuario com a senha fraca
            * def user_name = 'NomeID' + java.util.UUID.randomUUID()
            Given url baseUrl + '/Account/v1/User'
            * def usuario =
            """
            {
              "userName": "#(user_name)",
               "password": "123"
            }
            """
            And request usuario
            When method post
            Then status 400
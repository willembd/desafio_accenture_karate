package features.users;

import com.intuit.karate.junit5.Karate;

class UsersTestRunner {
    
    @Karate.Test
    Karate testUserCreate() {
        return Karate.run("create/users_create"
                ).relativeTo(getClass());

    }
    @Karate.Test
    Karate testUserAuthentication() {
        return Karate.run("classpath:features/users/authentication/authentication.feature"
        ).relativeTo(getClass());
    }

    @Karate.Test
    Karate testUserDelete() {
        return Karate.run("classpath:features/users/delete/users_delete.feature"
        ).relativeTo(getClass());
    }

}

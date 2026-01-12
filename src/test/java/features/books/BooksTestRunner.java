package features.books;

import com.intuit.karate.junit5.Karate;

public class BooksTestRunner {

    @Karate.Test
    Karate testBookCatalogList() {
        return Karate.run("classpath:features/books/listCatalog/books_list_catalog.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testBookSearchByIsbn() {
        return Karate.run("classpath:features/books/searchBook/search_books.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testBookAdd() {
        return Karate.run("classpath:features/books/addBooks/add_books.feature").relativeTo(getClass());
    }

    @Karate.Test
    Karate testBookUpadate() {
        return Karate.run("classpath:features/books/update/update_books.feature").relativeTo(getClass());
    }

}
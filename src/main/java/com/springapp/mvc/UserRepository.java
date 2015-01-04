package com.springapp.mvc;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by shcherbachenko on 29.12.2014.
 */
public interface UserRepository extends JpaRepository<User, Long> {
}

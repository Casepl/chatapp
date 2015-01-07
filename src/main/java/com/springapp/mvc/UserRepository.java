package com.springapp.mvc;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by shcherbachenko on 29.12.2014.
 */
public interface UserRepository extends JpaRepository<User, Long>, UserRepositoryCustom {
}
package com.brandjunhoe.dockerbuild

import org.springframework.beans.factory.annotation.Value
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

/**
 * Create by DJH on 2021/11/03.
 */
@RestController
@RequestMapping("/api")
class HomeController {

    @Value("\${sample.value}")
    val sample: String = ""

    @GetMapping
    fun check(): String = "check"

    @GetMapping("/sample")
    fun sample(): String = sample

}
package com.brandjunhoe.dockerbuild

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class DockerBuildApplication

fun main(args: Array<String>) {
    runApplication<DockerBuildApplication>(*args)
}

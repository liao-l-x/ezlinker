package com.ezlinker.app.emqintegeration.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
public class NodeInfo {
    private Float process_used;
    private Float process_available;
    private Float memory_used;
    private Float memory_total;
    private Float load5;
    private Float load15;
    private Float load1;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;
}

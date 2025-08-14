<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
    <div class="carousel" aria-label="영화관 주요 홍보 캐러셀">
        <button class="carousel-button prev">&#10094;</button>
        <div class="carousel-track">
            <div class="carousel-slide">
                <img src="https://picsum.photos/id/1015/1200/500" alt="영화1">
                <div class="carousel-caption">영화1 설명</div>
            </div>
            <div class="carousel-slide">
                <img src="https://picsum.photos/id/1016/1200/500" alt="영화2">
                <div class="carousel-caption">영화2 설명</div>
            </div>
            <div class="carousel-slide">
                <img src="https://picsum.photos/id/1018/1200/500" alt="영화3">
                <div class="carousel-caption">영화3 설명</div>
            </div>
        </div>
        <button class="carousel-button next">&#10095;</button>
        <div class="carousel-indicators">
            <div class="indicator active" data-slide="0"></div>
            <div class="indicator" data-slide="1"></div>
            <div class="indicator" data-slide="2"></div>
        </div>
    </div>
</main>

<script src="carousel.js"></script> <!-- JS 분리 추천 -->

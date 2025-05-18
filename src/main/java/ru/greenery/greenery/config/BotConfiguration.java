package ru.greenery.greenery.config;

import org.springframework.context.annotation.Configuration;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;
import ru.greenery.greenery.entity.Bot;

import javax.annotation.PostConstruct;

@Configuration
public class BotConfiguration {

    private final Bot bot;

    public BotConfiguration(Bot bot) {
        this.bot = bot;
    }

    @PostConstruct
    public void init() throws TelegramApiException {
        bot.botConnect();
    }


}

package br.ufmg.engsoft.reprova.model;

import br.ufmg.engsoft.reprova.Configuration;

public aspect QuestionVariability {
    pointcut helloWorldDiferenciado(Question.Builder builder,Object o):
            call(Question Question.Builder.build(..)) && target(builder) && this(o) && if(Configuration.isFineGrained());
    after(Question.Builder builder,Object o) returning (Question q) : helloWorldDiferenciado(builder,o) {
        System.out.println("Ola, eu passei aqui!");
        System.out.println(o);
    }
}
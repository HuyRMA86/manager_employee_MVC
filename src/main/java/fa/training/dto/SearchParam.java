package fa.training.dto;

import lombok.*;

import java.io.Serializable;


@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SearchParam implements Serializable {

    private String searchField;
    private String search;
}

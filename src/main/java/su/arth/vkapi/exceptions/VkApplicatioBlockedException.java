package su.arth.vkapi.exceptions;

import su.arth.vkapi.domain.OAuthToken;
import su.arth.vkapi.domain.error.VkErrorCode;
import su.arth.vkapi.domain.error.VkErrorResponse;

/**
 * Thrown then got error with errorCode=8
 * 
 * @author Alexey Grigorev
 * @see VkErrorCode
 * @see VkErrorResponse
 * 
 */
@SuppressWarnings("serial")
public class VkApplicatioBlockedException extends VkException {

    private final OAuthToken authToken;

    public VkApplicatioBlockedException(VkErrorResponse error, OAuthToken authToken) {
        super(error);
        this.authToken = authToken;
    }

    public OAuthToken getAuthToken() {
        return authToken;
    }

}

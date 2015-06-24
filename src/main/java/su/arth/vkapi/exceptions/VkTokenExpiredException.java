package su.arth.vkapi.exceptions;

import su.arth.vkapi.domain.OAuthToken;
import su.arth.vkapi.domain.error.VkErrorCode;
import su.arth.vkapi.domain.error.VkErrorResponse;

/**
 * Thrown when token used for accessing vk.com becomes expired (errorCode=5)
 * 
 * @author Alexey Grigorev
 * @see VkErrorCode
 * @see VkErrorResponse
 */
@SuppressWarnings("serial")
public class VkTokenExpiredException extends VkException {

    private final OAuthToken authToken;

    public VkTokenExpiredException(VkErrorResponse error, OAuthToken authToken) {
        super(error, "OAuthToken is expired: " + authToken);
        this.authToken = authToken;
    }

    public VkTokenExpiredException(OAuthToken oAuthToken) {
        super("OAuthToken is expired: " + oAuthToken);
        this.authToken = oAuthToken;
    }

    public OAuthToken getAuthToken() {
        return authToken;
    }
}

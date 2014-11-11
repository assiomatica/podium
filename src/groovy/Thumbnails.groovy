import java.awt.*
import java.awt.image.*
import java.io.*

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

/**
 *
 * @author utente
 */
class Thumbnails {
    
    def scala(String originalFile, String thumbnailFile, int thumbWidth,int thumbHeight) {
        double thumbRatio = (double)thumbWidth / (double)thumbHeight;

        def inp = new FileInputStream(originalFile);
        ImageInputStream iin = ImageIO.createImageInputStream(inp);
        ImageReader reader = ImageIO.getImageReaders(iin).next();
        reader.setInput(iin, true, true);
        BufferedImage original = reader.read(0);

        BufferedImage scaled;
        ImageIO.setUseCache(false);
        FileOutputStream fout;
        
	int imageWidth    = original.getWidth(null);
	int imageHeight   = original.getHeight(null);
        
	double imageRatio = (double)imageWidth / (double)imageHeight;
	if (thumbRatio < imageRatio)
	{
	    thumbHeight = (int)(thumbWidth / imageRatio);
	}
	else
	{
	    thumbWidth = (int)(thumbHeight * imageRatio);
	}

	if(imageWidth < thumbWidth && imageHeight < thumbHeight)
	{
	    thumbWidth = imageWidth;
	    thumbHeight = imageHeight;
	}
	else if(imageWidth < thumbWidth)
	    thumbWidth = imageWidth;
	else if(imageHeight < thumbHeight)
	    thumbHeight = imageHeight;

        scaled = awtScaleImage(original, thumbWidth, thumbHeight, Image.SCALE_SMOOTH);
        
        File afile

        afile=new File(thumbnailFile);
        if (afile.exists()) {
         afile.delete();
        }

        fout = new FileOutputStream(thumbnailFile);
        ImageIO.write(scaled, "png", fout);
        fout.flush();
        fout.close();
        iin.close();
        reader.dispose();
    }
    
    def static BufferedImage awtScaleImage(BufferedImage image,
                                       int thumbWidth, int thumbHeight, int hint) {
        // We use AWT Image scaling because it has far superior quality
        // compared to JAI scaling.  It also performs better (speed)!
       // 
       // since this code can run both headless and in a graphics context
        // we will just create a standard rgb image here and take the
        // performance hit in a non-compatible image format if any
        Image i = image.getScaledInstance(thumbWidth, thumbHeight, hint);
        image = new BufferedImage(thumbWidth, thumbHeight, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = image.createGraphics();
        g.drawImage(i, null, null);
        g.dispose();
        i.flush();
        return image;

    }
}


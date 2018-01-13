/************************************************************************************************************************************/
/** @file       UICheckBox.swift
 *  @project    0_0 - Checkbox
 *  @brief      x
 *  @details    x
 *
 *  @section    Opens
 *      none current
 *
 *  @section    Legal Disclaimer
 *      All contents of this source file and/or any other Jaostech related source files are the explicit property of Jaostech
 *      Corporation. Do not distribute. Do not copy.
 */
/************************************************************************************************************************************/
import UIKit


class UICheckbox: UIView {
    
    var imageView : UIImageView!;

    var uncheckedImage  :UIImage = UIImage(named:"anote_unchecked")!;
    var checkedImage    :UIImage = UIImage(named:"anote_checked")!;
    
    let loadDelay_s : Double = 0.05;
    
    var loadThread : Timer!;
    var fadeThread : Timer!;
    
    var state: Bool = false;
    
    
    /********************************************************************************************************************************/
    /** @fcn        init(view:UIView, xCoord:CGFloat, yCoord:CGFloat)
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    init(view:UIView, xCoord:CGFloat, yCoord:CGFloat) {

        super.init(frame:CGRect(x: xCoord, y: yCoord, width: 40, height: 40));

        //image init
        imageView  = UIImageView();
        
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40);
        
        imageView.image = uncheckedImage;

        //handle taps
        self.addTapRecognizer();

        //uiview setup: me<-image then main<-main
        self.addSubview(imageView);
        view.addSubview(self);
        
        print("UICheckbox.init():                      complete");
        
        return;
    }


    /********************************************************************************************************************************/
    /** @fcn        addTapRecognizer()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func addTapRecognizer() {
        
        let tapRecognizer : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UICheckbox.handleTap(_:)));
        
        tapRecognizer.numberOfTapsRequired    = 1;
        tapRecognizer.numberOfTouchesRequired = 1;
        
        self.addGestureRecognizer(tapRecognizer);
        self.isUserInteractionEnabled = true;
        
        return;
    }

    /********************************************************************************************************************************/
    /** @fcn        handleTap(_ recognizer:UITapGestureRecognizer)
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    @objc func handleTap(_ recognizer:UITapGestureRecognizer) {
        
        //Swap w/Fade
        let fadeAnim:CABasicAnimation = CABasicAnimation(keyPath: "contents");
        
        fadeAnim.fromValue = (self.imageView.image == uncheckedImage) ? uncheckedImage:checkedImage;
        fadeAnim.toValue   = (self.imageView.image == uncheckedImage) ? checkedImage:uncheckedImage;
        
        fadeAnim.duration = loadDelay_s;
        
        fadeAnim.delegate = self as? CAAnimationDelegate;
        
        
        //Update ImageView & State
        state = (self.imageView.image == uncheckedImage) ? true : false;    //if it was unchecked, now it's checked, true!

        imageView.image = (self.imageView.image == uncheckedImage) ? checkedImage:uncheckedImage;
        
        imageView.layer.add(fadeAnim, forKey: "contents");

        
        //Handle the Click
        self.buttonClicked();
        
        return;
    }
    
    /********************************************************************************************************************************/
    /** @fcn        buttonClicked()
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    func buttonClicked() {
        
        print("click - insert your handle code here!");
        
        return;
    }
    

    /********************************************************************************************************************************/
    /** @fcn        required init?(coder aDecoder: NSCoder)
     *  @brief      x
     *  @details    x
     */
    /********************************************************************************************************************************/
    required init?(coder aDecoder: NSCoder) { super.init(coder:aDecoder); }
}

